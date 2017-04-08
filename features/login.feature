Feature: Redfin Successful Login Test

  Scenario: Login Successfully 
    When I go to Redfin
    Then I will click the Sign In button
    And Enter Username
    And Enter Password
    And Click Sign In
    And Verify User is Logged In
    And Verify User is Logged In
    Then Verify we logged in
    Then Enter Filter
    Then Make Selection
    Then Verify Title