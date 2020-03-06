package handler

import (
	"net/http"

	"github.com/aws/aws-lambda-go/events"
	"github.com/emisgroup/appointments-v2-api/internal/constant"
	"github.com/emisgroup/appointments-v2-api/internal/logger"
	"github.com/emisgroup/appointments-v2-api/internal/response"
	"github.com/emisgroup/appointments-v2-api/internal/validator"
	"github.com/google/uuid"
)

// CreateHand
func (lambdaHandler LambdaHandler) CreateHand(request events.APIGatewayProxyRequest) events.APIGatewayProxyResponse {

	sessionGUID := uuid.New()

	validateResult, formattedDates := validator.ValidateSessionRequest(request.Body)

	if !validateResult.IsSuccess {
		return response.CreateErrorResponse(int(http.StatusBadRequest), validateResult.Message)
	}

	createSessionResponse, statusCode, err := lambdaHandler.HandlerService.CreateHand(request.Body, sessionGUID.String(), formattedDates)

	if err != nil {
		logger.Error(err.Error(), constant.Error)
		return response.CreateErrorResponse(statusCode, err.Error())
	}
	return response.Configuration().CreatedJSONApi(request, createSessionResponse)
}