@playlist

Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic playlist request
    Given I request the Mercury playlist with vodcrid and <platform>
    Then I get the requested vodcrid
    And the expiry date is in the future
    And I get the correct bitrate based on the <platform>
    And I get the correct base url based on the <platform>
    And I get the correct video type based on the <platform>

  Examples:
    | platform |
#   | DotCom   |
	| Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |

@not_local
@not_rc3
  Scenario Outline: Verify a HDS playlist request
    Given I request the Mercury playlist for HDS content with <platform>
    #Do we need this step?
	Then I get the requested HDS prodid 
    And the expiry date is in the future
	And I get the correct ManifestFile url based on the <platform>
	
  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Geo-blocking for Mercury playlists status sucess
    Given I request the Mercury playlist from <location> with vodcrid and <platform>
    Then I get the expected <response> status for that vodcrid

	#Second DotCom request is for HDS content.
  Examples:
    | platform | location      | response |
#   | DotCom   | 10.192.42.109 | success  |
	| Android  | 10.192.42.109 | success  |
    | Mobile   | 10.192.42.109 | success  |
    | Samsung  | 10.192.42.109 | success  |
    | PS3      | 10.192.42.109 | success  |
    | YouView  | 10.192.42.109 | success  |
#   | DotCom   | 10.192.42.109 | success  |

@not_local
@not_rc3
  Scenario Outline: Geo-blocking for Mercury playlists status blocked
    Given I request the Mercury playlist from <location> with vodcrid and <platform>
    Then I get the expected <response> status for that vodcrid

	#Second DotCom request is for HDS content.
    Examples:
    | platform | location      | response |
#   | DotCom   | 194.4.55.200  | blocked  |
	| Android  | 194.4.55.200  | blocked  |
    | Mobile   | 194.4.55.200  | blocked  |
    | Samsung  | 194.4.55.200  | blocked  |
    | PS3      | 194.4.55.200  | blocked  |
    | YouView  | 194.4.55.200  | blocked  |
#   | DotCom   | 194.4.55.200  | blocked  |

@not_local
  Scenario Outline: Ad-server for Mercury playlists
    Given I request the Mercury playlist with vodcrid and <platform>
    Then the advert URI should contain the correct size
    And the advert URI should contain the correct area
    And the advert URI should contain the correct site based on the <platform>

	#Second DotCom request is for HDS content.
  Examples:
    | platform |
#   | DotCom   |
	| Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |
#   | DotCom   |

  Scenario Outline: Verify Freesat playlist request
    Given I request a <platform> Mercury playlist with vodcrid
    Then I get the requested vodcrid in the response

   Examples:
	| platform |
	| Freesat  |

@not_local
  Scenario Outline: Verify correct Adverts for a Freesat playlist request
    Given I request a <platform> Mercury playlist with vodcrid
    Then the advert URI should contain the correct <size> and <site>

   Examples:
	| platform | size         | site        |
	| Freesat  | videofreesat | itv.freesat |

