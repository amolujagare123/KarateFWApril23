Feature: all scenarios related to job portal

  Background: setting the base url
    * url 'http://localhost:9897/'

  Scenario: to view all the jobs
   # Given url 'http://localhost:9897/'
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    Then match response ==
    """
    [
	{
		"jobId": 1,
		"jobTitle": "Software Engg",
		"jobDescription": "To develop andriod application",
		"experience": [
			"Google",
			"Apple",
			"Mobile Iron"
		],
		"project": [
			{
				"projectName": "Movie App",
				"technology": [
					"Kotlin",
					"SQL Lite",
					"Gradle"
				]
			}
		]
	}
]
    """

  Scenario: to view all the jobs check using negate operator
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    Then match response !=
    """
    [
	{
		"jobId": 10,
		"jobTitle": "Software Engg",
		"jobDescription": "To develop andriod application",
		"experience": [
			"Google",
			"Apple",
			"Mobile Iron"
		],
		"project": [
			{
				"projectName": "Movie App",
				"technology": [
					"Kotlin",
					"SQL Lite",
					"Gradle"
				]
			}
		]
	}
]
    """

  Scenario: to view all the jobs check job description
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    * def expectedJobDescription = 'To develop andriod application'
    * def resp =  response
   # * def actualJobDescription = 'resp.[0].jobDescription'
  #  * print "actual=" + resp.[0].jobDescription + "expected=" + expectedJobDescription
    And match resp.[0].jobDescription == expectedJobDescription
    And match resp.[0].jobTitle == 'Software Engg'
    And match resp.[0].experience[1] == 'Apple'
    And match resp.[0].experience[*] == [ 'Google','Apple' , 'Mobile Iron']
    And match resp.[0].experience == '#[3]'
    And match resp.[0].experience[*] contains [ 'Apple' ]

  Scenario: to view all the jobs in xml format
    Given path '/normal/webapi/all'
    And header accept = 'application/xml'
    When method get
    Then status 200
    * print response
    And match response !=
    """
    <List>
  <item>
    <jobId>2</jobId>
    <jobTitle>Software Engg</jobTitle>
    <jobDescription>To develop andriod application</jobDescription>
    <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
    </experience>
    <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
    </project>
  </item>
</List>
    """


  Scenario: to view all the jobs in xml format check job description
    Given path '/normal/webapi/all'
    And header accept = 'application/xml'
    When method get
    Then status 200
    * print response
    And match response/List/item/jobDescription == 'To develop andriod application'
   # And match response//jobDescription == 'To develop andriod application'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[2] == 'Apple'

  Scenario: to view all the jobs check job description & print
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    * def expectedJobDescription = 'To develop andriod application 1'
    * def actualJobDescription = response[0].jobDescription
    * print "actual=" + actualJobDescription + " expected=" + expectedJobDescription
    And match actualJobDescription == expectedJobDescription