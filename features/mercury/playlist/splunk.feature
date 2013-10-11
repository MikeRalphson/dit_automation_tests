Feature: Secure Session Token

  As a tester
  I want to be able to use a service that requires Secure Session Token
  Because that is not an uncommon requirement

  Scenario Outline: Connecting to the Splunk host to retrieve a session key
    Given I have a piece of <platform> catchup content
    When I login in to <platform> Splunk
    Then the return value should match the secure session token

  Examples:
  | platform |
  | DotCom   |
  | Android  |
  | Mobile   |
  | Samsung  |
  | PS3      |
  | YouView  |

  Scenario: Error log page returning the correct status code
    When I request the error log page for DotCom
    Then the HTTP status code should return OK

  Scenario Outline: Error log page returning the correct status code
    When I request the error log page for DotCom
    Then the response should not return these status <codes>

  Examples:
  | codes   |
  | 401     |
  | 403     |
  | 404     |
@splunk
  Scenario Outline: Querying jobs from Splunk and verifying them
    Given I have a piece of <platform> catchup content
    And I have a valid search results set
    When I request the Mercury playlist for Splunk
    And I send a query request to Splunk
    Then I should get the correct playlist data from Splunk

  Examples:
  | platform |
  | DotCom   |
  | Android  |
  | Mobile   |
  | Samsung  |
  | PS3      |
  | YouView  |
