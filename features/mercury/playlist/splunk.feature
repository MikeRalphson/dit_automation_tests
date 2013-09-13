Feature: Secure Session Token

  As a tester
  I want to be able to use a service that requires Secure Session Token
  Because that is not an uncommon requirement

  Scenario: Passing proper credentials to a page with basic authentication
    When I try to login
    Then the return value should match the secure session token

  Scenario: Error log page returning the correct status code
    When I request the error log page
    Then the HTTP status code should return OK

  Scenario Outline: Error log page returning the correct status code
    When I request the error log page
    Then the response should not return these status <codes>

  Examples:
  | codes |
  | 401   |
  | 403   |
  | 404   |
