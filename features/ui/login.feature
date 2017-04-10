Feature: Use Redfin to test the following Login scenarios using Ruby, Cucumber, and Capybara

# Scenario: Signing in with valid username and password. Verify that you are signed in. 
#   When I go to Redfin
#   Then I will click the Sign In button
#     And Enter Username
#     And Enter Password
#     And Click Sign In
#     And Verify User is Signed In
#   Then Enter Filter
#     And Make Selection
#     And Verify Title

# Scenario: Login Unsuccessfully 
#   When I go to Redfin
#   Then I will click the Sign In button
#   And Enter Username
#   And Enter Invalid Password
#   And Click Sign In
#   Then Verify Login Error

Scenario Outline: Searching for a property in a city with at least 3 filters. Verify that you get results back and that each result matches your criteria. 
  When I go to Redfin
  Then I will click the Sign In button
    And Enter Username "<login>"
    And Enter Password "<password>"
    And Click Sign In
    And Verify User is Signed In as "<name>"
  Given the address "<street>" "<city>" "<state>" "<zip>"
  Then Enter Filter
  Then Make Selection
    And Verify Title
    And Verify Address
    Examples:
    | login                     | password | name   |  street         | city          | state | zip     |
    | sushil.mayer@hotmail.com  | Redfin1! | Sushil | 4321 Pearl Ct   | Cypress       | CA    | 90630   |
    | sushil.mayer@hotmail.com  | Redfin1! | Sushil | 16 Trieste      | Irvine        | CA    | 92606   |
    | sushil.mayer@hotmail.com  | Redfin1! | Sushil | 13744 Kyle Dr   | Cerritos      | CA    | 90703   |