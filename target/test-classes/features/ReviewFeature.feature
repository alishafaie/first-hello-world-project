@EndtoEnd
Feature: Automation End to End 

Background: generate Token 
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor", "password": "tek_supervisor"}
When method post
Then status 200
* def generatedToken = response.token
* def generator = Java.type('tiger.api.testreviewsession.ReviewDataGenerator')

Scenario: Create New Account using Data Generator and adding address and car
	* def email = generator.getEmail()
	* def firstName = generator.getFirstName()
	* def lastName = generator.getLastName()
	* def dob = generator.getDob()
	Given path "/api/accounts/add-primary-account"		
	And request 
	"""
	{
	"email": "#(email)", 
	"title": "Mr.", 
	"firstName": "#(firstName)", 
	"lastName": "#(lastName)", 
	"gender": "FEMALE", 
	"maritalStatus": "MARRIED", 
	"employmentStatus": "EMPLOYED", 
	"dateOfBirth": "#(dob)"
	}
	"""
	And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  * def generatedId = response.id
  And print generatedId
  And print response
  Then assert response.email == email
  
  * def addressLine1 = generator.getAddressLine1()
	* def city = generator.getCity()
	* def state = generator.getState()											
	* def postalCode = generator.getPostalCode()
	* def countryCode = generator.getCountryCode()
	Given path "/api/accounts/add-account-address" 	
	And request
	"""
	{
  "addressLine1": "#(address)",
  "city": "#(city)",
  "state": "#(state)",
  "postalCode": "#(postalCode)",
  "countryCode": "1",
  }
	"""
	And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  * def generatedId = response.id
  And print generatedId
  And print response
  
 
 
  Given path "/api/accounts/add-account-car"
  And request
  """
  {
  "id": 0,
  "make": "Porsche",
 	"model": "911",
 	"year": "1991",
 	"licensePlate": "Brrrr"
	}  
  """
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  And print response
	
	
	
	