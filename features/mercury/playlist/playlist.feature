@playlist
Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic playlist request
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist
    Then I get the correct production
    And the expiry date is in the future
    And I get the correct bitrates
    And I get the correct base url
    And I get the correct video type

  Examples:
    | platform  |
    | DotCom    |
    | Android   |
    | Mobile    |
    | Samsung   |
    | PS3       |
    | YouView   |
    | NowTV     |

  Scenario: Verify basic Freesat request
    Given I have a piece of Freesat catchup content
    When I request the Mercury playlist
    Then I get the correct production

  Scenario Outline: Geo-blocking Mercury playlists for valid locations
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist from <location>
    Then I get a <status> response

  Examples:
    | platform | location      | status     |
    | DotCom   | 10.192.42.109 | successful |
    | Android  | 10.192.42.109 | successful |
 #  | Mobile   | 10.192.42.109 | successful | https://desk.gotoassist.com/incidents/21643
    | Samsung  | 10.192.42.109 | successful |
    | PS3      | 10.192.42.109 | successful |
    | YouView  | 10.192.42.109 | successful |

  @not_local
  Scenario Outline: Geo-blocking Mercury playlists for invalid locations
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist from <location>
    Then I get a <status> response

  Examples:
    | platform | location     | status  |
    | DotCom   | 194.4.55.200 | blocked |
    | Android  | 194.4.55.200 | blocked |
#   | Mobile   | 194.4.55.200 | blocked | https://desk.gotoassist.com/incidents/21643 - problems with secure https link
    | Samsung  | 194.4.55.200 | blocked |
    | PS3      | 194.4.55.200 | blocked |
    | YouView  | 194.4.55.200 | blocked |

  Scenario Outline: Sting verification for non-Android and non-YouView platforms
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist
    Then I get a single .mp4 sting with a bitrate of 0

  Examples:
    | platform |
    | DotCom   |
    | Mobile   |
    | Samsung  |
    | PS3      |

  Scenario: Sting verification for YouView
    Given I have a piece of YouView catchup content
    When I request the Mercury playlist
    Then I get a single .ts sting with a bitrate of 0

  Scenario: Sting verification for Android
    Given I have a piece of Android catchup content
    When I request the Mercury playlist
    Then I get two .mp4 stings with bitrates of 300 and 600

  Scenario Outline: DN-338 Irdeto Session ID for non-DotCom catchup content
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist
    Then there should not be a Session ID in the response

  Examples:
    | platform |
    | Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |

  Scenario: DN-338 Irdeto Session ID for DotCom catchup content
    Given I have a piece of Dotcom catchup content
    When I request the Mercury playlist
    Then there should be a Session ID in the response

  @not_ft02
  Scenario: Unauthorised access for Samsung TV platform
    Given I have a piece of Samsungtv catchup content
    When I request the Mercury playlist
    Then there should be an unauthorised message

  @not_ft02
  Scenario: NowTV should only be requestsd with HLS
    Given I have a piece of Nowtv catchup content
    And stream type HLS is not requested
    When I request the Mercury playlist
    Then there should be an unauthorised message

  @mercury-csmil
  Scenario: NowTV should return a cmsil in the Mercury playlist response
    Given I have a piece of NowTV catchup content
    When I request the Mercury playlist
    Then I should get a valid csmil returned in the response
