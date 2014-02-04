@wip @rest-service
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

  Scenario Outline: Verify new playlist cannot be accessed via http
    Given I have a piece of <platform> catchup content
    When I request the new playlist service via http
    Then I should get a status code of 501

  Examples:
    | platform    |
    | DotCom      |
    | Android     |
    | Mobile      |
    | Samsung     |
    | PS3         |
    | YouView     |
    | Freesat     |

  @csmil
  Scenario Outline: Verify csmil in the new playlist
    Given I have a piece of <platform> catchup content
    When I request the new playlist service
    Then I should get csmil in the media files url

  Examples:
    | platform    |
    | Samsung     |
    | Android     |
