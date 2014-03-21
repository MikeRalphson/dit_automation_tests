@rest-service
Feature: New Playlist Rest Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request new playlists

  Scenario Outline: Verify new playlist for the supported platforms
    Given I have a piece of <platform> catchup content
    When I request the new playlist service
    Then I should get a valid status code
    And I get the correct production ID

  Examples:
    | platform    |
    | DotCom      |
    | Android     |
    | Mobile      |
    | Samsung     |
    | PS3         |
    | YouView     |
    | Freesat     |

  @not_ft02
  Scenario Outline: Verify new playlist cannot be accessed via http
    Given I have a piece of <platform> catchup content
    When I request the new playlist service via http
    Then I should get a connection refused message

  Examples:
    | platform    |
    | DotCom      |
    | Android     |
    | Mobile      |
    | Samsung     |
    | PS3         |
    | YouView     |
    | Freesat     |

  @not_i01
  Scenario Outline: Rule => Passing an empty hmac token in playlist request should give a 403 http error
    Given I have a piece of <platform> catchup content
    When I request the playlist service with a blank hmac token for supported platforms
    Then I should get a 403 forbidden response code

  Examples:
    | platform    |
    | Android     |
    | Samsung     |

  Scenario: Rule =>  Verify an invalid production id returns an error message and 400 http code
    Given I have a piece of Samsung catchup content
    And I have an invalid production id
    When I request the new playlist service
    Then I should get a valid error response for invalid format
    And the status code should be 400

  Scenario: Rule => Verify unsupported platforms return a 501 http status code
    Given I have a piece of Freesat catchup content
    When I request the new playlist service
    Then I should get a valid platform not supported message
    And the status code should be 501

  Scenario: Rule => Verify not implemented UTV broadcast returns the correct message
    Given I have a piece of Samsung catchup content
    And I have a broadcast type of UTV
    When I request the new playlist service
    Then I should get a valid response for broadcast type not implemented
    And the status code should be 501

  Scenario: Rule => Verify production ids that have no assets return a 404 - not found http code
    Given I have a piece of Samsung catchup content
    And I have no asset information
    When I request the new playlist service
    Then I should get a valid response indicating no assets found
    And I should get a 404 no content status code

  Scenario: Rule => Production ids with no renditions should return a 204 - no content http code
    Given I have a piece of Samsung catchup content
    And I have no rendtions for a production id
    When I request the new playlist service
    Then I should get a 204 no content status code

  Scenario: Rule => NowTV using Mercury request should validate the video rendition names
    Given I have a piece of NowTV catchup content
    And I have a production id which has invalid rendition names
    When I request the Mercury playlist
    Then I should get a match uri And bitrate pattern error

  @csmil
  Scenario Outline: Verify csmil in the new playlist
    Given I have a piece of <platform> catchup content
    When I request the new playlist service
    Then I should get csmil in the media files url

  Examples:
    | platform    |
    | Samsung     |
    | Android     |

  Scenario: Verify the response for an Android playlist returns the correct base uri
    Given I have a piece of Android catchup content
    When I request the new playlist service
    Then the response should contain a base uri populated with the Akamai config
