package main

import (
	"net/http"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	authrequest "github.com/emisgroup/appointments-v2-api/internal/api-request"
	"github.com/emisgroup/appointments-v2-api/internal/constant"
	"github.com/emisgroup/appointments-v2-api/internal/database"
	"github.com/emisgroup/appointments-v2-api/internal/handler"
	"github.com/emisgroup/appointments-v2-api/internal/logger"
	"github.com/emisgroup/appointments-v2-api/internal/response"
	"github.com/emisgroup/appointments-v2-api/internal/validator"
	_ "github.com/lib/pq"
)

var (
	err error = getConnectionString()
)

func getConnectionString() error {
	err := database.SetConnectionStrings()
	return err
}
func main() {
	lambda.Start(handleRequest)
}

func handleRequest(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	resp, valid := validator.ValidateJSONAPIRequest(request)
	if !valid {
		return resp, nil
	}
	if err != nil {
		logger.Error(err.Error(), constant.Error)
		return response.CreateErrorResponse(int(http.StatusInternalServerError), constant.InternalError), nil
	}
	err = authrequest.SetToken(request)
	if err != nil {
		logger.Error(err.Error(), constant.Error)
		return response.CreateErrorResponse(int(http.StatusInternalServerError), constant.InternalError), nil
	}
	handler := handler.NewLambdaHandler()
	response := handler.DeleteSession(request)
	return response, nil
}
