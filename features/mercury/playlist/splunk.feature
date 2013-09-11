Feature: Secure Session Token

  As a tester
  I want to be able to use a service that requires Secure Session Token
  Because that is not an uncommon requirement

  @splunk
  Scenario: Passing proper credentials to a page with basic authentication
    When I try to login
    Then the return value should match the secure session token
