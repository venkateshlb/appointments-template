package service
​
import (
	"net/http"
​
	"github.com/emisgroup/appointments-v2-api/internal/response"
)
​
// CreateServ function
func (repoService RepoService) CreateServ(requestBody string) (*response.Session, int, error) {
	/*
	* Validation section
​	 */

	/*
	* Query Build section
​	 */

	/*
	* Database Handling Section
​	 */

	/*
	* Process the Data
​	 */

	return &session, int(http.StatusCreated), nil
}