Feature: all sample user requests

  @SampleUser1
  Scenario: to view all the users
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200

  @SampleUser2
  Scenario: to view all the users another way
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method get
    Then status 200

    @SingleUser
    Scenario: to view single user
      Given url 'https://reqres.in'
      And path '/api/users/2'
      When method get
      Then status 200

      @createUser
  Scenario: to create a single user
    Given url 'https://reqres.in'
    And path '/api/users'
    And request
    """
    {
      "name": "Vishal",
      "job":  "Test lead"
    }
    """
    When method post
    Then status 201

        @UpdateUser
        Scenario: To test the update user request
          Given url 'https://reqres.in'
          And path '/api/users/2'
          * request
          """
           {
              "name": "Vishal 1",
              "job":  "Test lead 1"
            }
          """
          When method put
          Then status 200
          And print 'printing direct response'
          And print response
          And print 'printing response using variable'
          And def res = response
          And print res
          #And print 'name=' , response.name
          And print 'name=' , res.name