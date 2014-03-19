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
  Scenario Outline:
    Given I have a piece of <platform> catchup content
    When I request the playlist service with a blank hmac token for supported platforms
    Then I should get a 403 http status error

  Examples:
    | platform    |
    | Android     |
    | Samsung     |

  @csmil
  Scenario Outline: Verify csmil in the new playlist
    Given I have a piece of <platform> catchup content
    When I request the new playlist service
    Then I should get csmil in the media files url

  Examples:
    | platform    |
    | Samsung     |
    | Android     |

  Scenario:
    Given I have a piece of Samsung catchup content
    And I have an invalid production id
    When I request the new playlist service
    Then I should get a valid error response for invalid format
    And the status code should be 400

  Scenario:
    Given I have a piece of Freesat catchup content
    When I request the new playlist service
    Then I should get a valid platform not supported message
    And the status code should be 501

  Scenario:
    Given I have a piece of Samsung catchup content
    And I have a broadcast type of UTV
    When I request the new playlist service
    Then I should get a valid response for broadcast type not implemented
    And the status code should be 501

  Scenario:
    Given I have a piece of Samsung catchup content
    And I have no asset information
    When I request the new playlist service
    Then I should get a valid response indicating no assets found
    And I should get a 404 no content status code

  Scenario:
    Given I have a piece of Samsung catchup content
    And I have no rendtions for a production id
    When I request the new playlist service
    Then I should get a 204 no content status code
  @a-csmil
  Scenario:
    Given I have a piece of Android catchup content
    When I request the new playlist service
    Then the response should contain a base uri populated with the Akamai config
