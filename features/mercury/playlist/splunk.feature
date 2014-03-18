@splunk
Feature: Query Splunk API

  So that I can verify playlists are being requested,
  As a tester,
  I want to be able to query the Splunk API

  Scenario: Error log page returns the correct status code
    When I request the error log page for DotCom
    Then the HTTP status code should return 200

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
    | NowTV    |
