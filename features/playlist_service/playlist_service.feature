@rest-service @not_i01
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

#  @rest-rule
#  Scenario:
#    Given I have a piece of Samsung catchup content
#    And I have an invalid production id
#    When I request the new playlist service
#    Then I should get a valid error response for invalid format
#    And the status code should be 400
#
#  @rest-rule
#  Scenario:
#    Given I have a piece of Freesat catchup content
#    When I request the new playlist service
#    Then I should get a valid platform not supported message
#    And the status code should be 501
#
#  @rest-rule
#  Scenario:
#    Given I have a piece of Samsung catchup content
#    And I have a broadcast type of UTV
#    When I request the new playlist service
#    Then I should get a valid response for broadcast type not implemented
#    And the status code should be 501
#
#  @rest-rule
#  Scenario:
#    Given I have a piece of Samsung catchup content
#    And I have no asset information
#    When I request the new playlist service
#    Then I should get a valid response indicating no assets found
#    And I should get a 404 no content status code
#
##  @rest-rule
##  Scenario:
##    Given I have a piece of Samsung catchup content
##    And I have no rendtions for a production id
##    When I request the new playlist service
##    Then I should get a valid response indicating no licensed contact for platform
##    And I should get a 403 no licensed renditions status code
#
#  @rest-rule
#  Scenario:
#    Given I have a piece of Samsung catchup content
#    And none of the renditions match the uri structure
#    When I request the new playlist service
#    Then I should get a valid error response stating uri mismatch
#    And the status code should be 500
