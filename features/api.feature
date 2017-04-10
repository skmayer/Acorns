Feature: Use Edmunds The_Vehicle_API to test the following scenarios using Ruby, RSpec, and Faraday

  Scenario Outline: Search for the make, model, year of your car 
  and verify the response status and that the response body contains the results that match your criteria.
 
    Given vehicle state "<state>"
      And vehicle year "<year>"
      And vehicle make "<make>"
      And vehicle submodel "<submodel>"
    Then Make an API Call
    # Then Make an API Call with state "<state>" year "<year>" make "<make>" submodel "<submodel>"
Examples:
    | state | year  | make  | submodel  |
    | new   | 2014  | audi  | a5        |
    | used  | 2012  | honda | accord    | 