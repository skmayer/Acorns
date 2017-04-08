Feature: Redfin Invalid Login Test

  Scenario: Login Unsuccessfully 
    When I go to Redfin
    Then I will click the Sign In button
    And Enter Username
    And Enter Invalid Password
    And Click Sign In
    Then Verify Login Error 