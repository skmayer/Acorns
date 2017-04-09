Feature: Use Edmunds The_Vehicle_API to test the following scenarios using Ruby, RSpec, and Faraday

  Scenario Outline: Search for the make, model, year of your car 
  and verify the response status and that the response body contains the results that match your criteria.
 
    # Then Make API Call with state "new" and year "2014" and submodel "a5"
    Then Make API Call with make "<make>" and state "<state>" and year "<year>" and submodel "<submodel>"
Examples:
    | make  | state | year  | submodel  |
    | audi  | new   | 2014  | a5        |