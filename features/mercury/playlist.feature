@playlist
Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic playlist request
    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then I get the requested <vodcrid>
    And the expiry date is in the future
    And I get the correct bitrate based on the <platform>
    And I get the correct base url based on the <platform>
    And I get the correct video type based on the <platform>

  Examples:
    | vodcrid | platform |
    | 255721  | DotCom   |
	| 255730  | Android  |
    | 255730  | Mobile   |
    | 255730  | Samsung  |
    | 255730  | PS3      |
    | 255734  | YouView  |
#    | 301871  | HDS       |
#    | 301871  | HLS       |
#    | 301871  | Simulcast |

  Scenario Outline: Geo-blocking for Mercury playlists
    Given I request the Mercury playlist from <location> with <vodcrid> and <platform>
    Then I get the expected <response> status for that <vodcrid>

  Examples:
    | vodcrid | platform | location      | response |
    | 255721  | DotCom   | 10.192.42.109 | success  |
	| 255730  | Android  | 10.192.42.109 | success  |
    | 255730  | Mobile   | 127.0.0.1     | success  |
    | 255730  | Samsung  | 10.192.42.109 | success  |
    | 255730  | PS3      | 10.192.42.109 | success  |
    | 255734  | YouView  | 10.192.42.109 | success  |
    #    | 301871  | HDS       | 10.192.42.109 | success  |
    #    | 301871  | HLS       | 10.192.42.109 | success  |
    #    | 301871  | Simulcast | 10.192.42.109 | success  |
    | 255721  | DotCom   | 194.4.55.200  | blocked  |
	| 255730  | Android  | 194.4.55.200  | blocked  |
    | 255730  | Mobile   | 194.4.55.200  | blocked  |
    | 255730  | Samsung  | 62.4.31.255   | blocked  |
    | 255730  | PS3      | 194.4.55.200  | blocked  |
    | 255734  | YouView  | 194.4.55.200  | blocked  |
#    | 301871  | HDS       | 194.4.55.200 | success  |
#    | 301871  | HLS       | 194.4.55.200 | success  |
#    | 301871  | Simulcast | 194.4.55.200 | success  |

  Scenario Outline: Ad-server for Mercury playlists
    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then the advert URI should contain the correct size
    And the advert URI should contain the correct area
    And the advert URI should contain the correct site based on the <platform>

  Examples:
    | vodcrid | platform |
    | 255721  | DotCom   |
	| 255730  | Android  |
    | 255730  | Mobile   |
    | 255730  | Samsung  |
    | 255730  | PS3      |
    | 255734  | YouView  |
#    | 301871  | HDS       |
#    | 301871  | HLS       |
#    | 301871  | Simulcast |

  Scenario Outline: Verify Freesat playlist request
    Given I request a <platform> Mercury playlist with <vodcrid>
    Then I get the requested vodcrid in the response <vodcrid>
	
   Examples:
	| vodcrid | platform |
	| 255733  | Freesat  |
	
  Scenario Outline: Verify correct Adverts for a Freesat playlist request
    Given I request a <platform> Mercury playlist with <vodcrid>
    Then the advert URI should contain the correct <size> and <site>
	
   Examples:
	| vodcrid | platform | size         | site        |
	| 255733  | Freesat  | videofreesat | itv.freesat |
