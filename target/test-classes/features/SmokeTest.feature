@Smoke
Feature: Authentication Smoke Test

Scenario: Generate Token with valid username and valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request  
"""
{
"username": "supervisor", 
"password": "tek_supervisor"
}
"""
When method post
Then status 200
And print response

Scenario: generate Token with invalid username and valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request 
"""
{
"username": "upervisor",
"password": "tek_supervisor"
}
"""
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "USER_NOT_FOUND"
