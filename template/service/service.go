package service

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"time"

	authrequest "github.com/emisgroup/appointments-v2-api/internal/api-request"
	"github.com/emisgroup/appointments-v2-api/internal/audit"
	"github.com/emisgroup/appointments-v2-api/internal/constant"
	"github.com/emisgroup/appointments-v2-api/internal/logger"
	"github.com/emisgroup/appointments-v2-api/internal/request"
	"github.com/emisgroup/appointments-v2-api/internal/response"
	"github.com/google/jsonapi"
)

// CreateServ
func (repoService RepoService) CreateServ(requestBody string, sessionUUID string, formattedDates *request.DateTimeStamp) (*response.Session, int, error) {
	result := new(request.CreateServRequest)
	err := jsonapi.UnmarshalPayload(bytes.NewBufferString(requestBody), result)
	var session response.Session
	if err != nil {
		logger.Error(err.Error(), constant.Error)
		return &session, int(http.StatusInternalServerError), err
	}

	sessionStatusCode, err := ValidateMetadata(result.SessionMetadata)
	if sessionStatusCode != int(http.StatusOK) {
		return nil, int(http.StatusBadRequest), err
	}

	slotStatusCode, err := ValidateMetadata(result.SlotMetadata)
	if slotStatusCode != int(http.StatusOK) {
		return nil, int(http.StatusBadRequest), err
	}

	slotMetadata, _ := json.Marshal(result.SlotMetadata)
	sessionMetadata, _ := json.Marshal(result.SessionMetadata)

	formattedSlotDuration := MinutesToHours(result.SlotDuration)
	token := authrequest.GetToken()
	currentTime := time.Now().UTC().Format(constant.DateFormat)
	sessionErn := constant.SessionErnFormat + sessionUUID
	sqlStatement := `insert into appointments.session
						(domain, owner_id, metadata, session_guid, 
						deleted, start_datetime, end_datetime, 
						slot_duration, date_created, created_by,session_ern) values ('%s','%s','%s','%s',%s,'%s','%s','%s','%s','%s','%s') returning session_id`

	dbQuery := fmt.Sprintf(sqlStatement, token.OrgERN(), result.OwnerID, string(sessionMetadata),
		sessionUUID, "null", result.Start,
		result.End, formattedSlotDuration, currentTime, token.UserERN(), sessionErn)

	session.SessionERN = sessionErn
	defer repoService.DatabaseService.DbClose()
	tx, err := repoService.DatabaseService.TxBegin()
	rows, err := repoService.DatabaseService.TxQuery(tx, dbQuery)

	if err != nil || rows == nil {
		if err != nil {
			logger.Error(err.Error(), constant.Error)
		}
		return &session, int(http.StatusInternalServerError), errors.New(constant.InternalError)
	}
	var sessionID int
	for rows.Next() {
		err = rows.Scan(&sessionID)
	}

	if err != nil {
		logger.Error(err.Error(), constant.Error)
		return &session, int(http.StatusInternalServerError), errors.New(constant.InternalError)
	}

	slotCount := int(formattedDates.End.Sub(formattedDates.Start).Minutes()) / result.SlotDuration

	var sessionDetails response.Session
	sessionDetails.SessionID = sessionID
	sessionDetails.SlotDuration = result.SlotDuration
	_, sloterr := repoService.InsertSlotQuery(tx, &sessionDetails, slotMetadata, formattedDates.Start, slotCount, result.HolderID)

	if sloterr != nil {
		return nil, int(http.StatusInternalServerError), errors.New(constant.InternalError)
	}

	_, sessionerr := repoService.DenormaliseSession(tx, sessionUUID)

	if sessionerr != nil {
		return nil, int(http.StatusInternalServerError), errors.New(constant.InternalError)
	}

	if err = repoService.DatabaseService.TxComplete(tx); err != nil {
		logger.Error(err.Error(), constant.Error)
		return nil, int(http.StatusInternalServerError), errors.New(constant.InternalError)
	}
	audit.LogAuditAPIDetails("session has been successfully created!")
	return &session, int(http.StatusCreated), nil
}

// MinutesToHours function
func MinutesToHours(inMinutes int) string {
	hours := inMinutes / 60
	minutes := inMinutes % 60
	str := fmt.Sprintf("%02d:%02d:00", hours, minutes)
	return str
}