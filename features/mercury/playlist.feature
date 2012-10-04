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
    | 301871  | DotCom   |
#	| 301871  | Android  |
    | 301871  | Mobile   |
    | 301871  | Samsung  |
    | 301871  | PS3      |
    | 301871  | YouView  |


  Scenario Outline: Verify a HDS playlist request
    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then I get the requested <vodcrid>
    And the expiry date is in the future
	And I get the correct ManifestFile url based on the <platform>
	
  Examples:
    | vodcrid | platform |
    | 303312  | DotCom   |


  Scenario Outline: Geo-blocking for Mercury playlists
    Given I request the Mercury playlist from <location> with <vodcrid> and <platform>
    Then I get the expected <response> status for that <vodcrid>
	
	#Second DotCom request is for HDS content. 
  Examples:
    | vodcrid | platform | location      | response |
    | 301871  | DotCom   | 10.192.42.109 | success  |
#	| 301871  | Android  | 10.192.42.109 | success  |
    | 301871  | Mobile   | 127.0.0.1     | success  |
    | 301871  | Samsung  | 10.192.42.109 | success  |
    | 301871  | PS3      | 10.192.42.109 | success  |
    | 301871  | YouView  | 10.192.42.109 | success  |
    | 303312  | DotCom   | 10.192.42.109 | success  |
    | 301871  | DotCom   | 194.4.55.200  | blocked  |
#	| 301871  | Android  | 194.4.55.200  | blocked  |
    | 301871  | Mobile   | 194.4.55.200  | blocked  |
    | 301871  | Samsung  | 62.4.31.255   | blocked  |
    | 301871  | PS3      | 194.4.55.200  | blocked  |
    | 301871  | YouView  | 194.4.55.200  | blocked  |
    | 303312  | DotCom   | 194.4.55.200  | blocked  |

  Scenario Outline: Ad-server for Mercury playlists
    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then the advert URI should contain the correct size
    And the advert URI should contain the correct area
    And the advert URI should contain the correct site based on the <platform>
	
	#Second DotCom request is for HDS content. 
  Examples:
    | vodcrid | platform |
    | 301871  | DotCom   |
#	| 301871  | Android  |
    | 301871  | Mobile   |
    | 301871  | Samsung  |
    | 301871  | PS3      |
    | 301871  | YouView  |
    | 301871  | DotCom   |

  Scenario Outline: Verify Freesat playlist request
    Given I request a <platform> Mercury playlist with <vodcrid>
    Then I get the requested vodcrid in the response <vodcrid>
	
   Examples:
	| vodcrid | platform |
	| 301871  | Freesat  |
	
  Scenario Outline: Verify correct Adverts for a Freesat playlist request
    Given I request a <platform> Mercury playlist with <vodcrid>
    Then the advert URI should contain the correct <size> and <site>
	
   Examples:
	| vodcrid | platform | size         | site        |
	| 301871  | Freesat  | videofreesat | itv.freesat |
