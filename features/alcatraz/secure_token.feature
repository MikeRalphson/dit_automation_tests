@live
Feature: Alcatraz Secure Token
  So that users cannot watch the same content concurrently,
  As Alcatraz,
  I want to provide a secure token for Mercury

  Scenario: Secure Token Retrieval
    Given I request the secure token from Alcatraz
    Then the secure token should be correct
