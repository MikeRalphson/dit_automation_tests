Feature: Playlist Service 
  In order to show a playlist
  As an Client
  I want to request a playlist from mercury

Scenario: Mobile Playlist Request
  And A Video Production for "Mobile" with a unique Production Id is ingested
  When I setup a playlist request for Mobile
  Then the "Mobile" playlist for this vodcrid should contain the following top-level properties of the Video Production:
    | Property Name      |
	| ProductionId       |
    | Vodcrid			 |
    | ExpiryDate		 |
    | VideoType			 |
    | ProgrammeTitle	 |
    | TransmissionDate	 |
    | TransmissionTime	 |
    | Duration			 |
    | EpisodeTitle		 |
    | EpisodeNumber 	 |

Scenario: Simulcast Playlist Request
  Given A Video Production for Dotcom with Vodcrid SIM1 is ingested
  When I setup a playlist request for Vodcrid SIM1 for Dotcom  
  Then I should receive a valid playlist containing the following details
  | Vodcrid             | VideoType | Bitrate |
  | crid://itv.com/SIM1 | SIMULCAST | 800000  |

Scenario: Youview Playlist Request
  And A Video Production for "Youview" with a unique Production Id is ingested
  When I setup a playlist request for Youview
  Then the "Youview" playlist for this vodcrid should contain the following top-level properties of the Video Production:
    | Property Name      |
	| ProductionId       |
    | Vodcrid			 |
    | ExpiryDate		 |
    | VideoType			 |
    | ProgrammeTitle	 |
    | TransmissionDate	 |
    | TransmissionTime	 |
    | Duration			 |
    | EpisodeTitle		 |
    | EpisodeNumber 	 |

Scenario: Dotcom and then Youview
  And A Video Production for "DotCom" with a Production Id of "A/123/bmv" is ingested
  And A Video Production for "YouView" with a Production Id of "A/123/bmv" is ingested with update

#Default Lithium has old DB..
@wip
Scenario: Request a News video with adverts
	Given There the News video below is available
	| Title | BodyCopy  | Notes      | Description     | Filename | Region  | DateIngested | Duration | OriginalFileName |
	| Iran  | Iran body | Some Notes | The description | Iran1    | Granada | 2011-01-01   | 1        | Iran             |
	When I request a dotcom playlist for the news video above with adverts
	Then I should receive a valid playlist
	And there should be 2 ads in the post roll only

#Default Lithium has old DB..
@wip
Scenario: Request a News video with no adverts
	Given There the News video below is available
	| Title | BodyCopy  | Notes      | Description     | Filename | Region  | DateIngested | Duration | OriginalFileName |
	| Iran  | Iran body | Some Notes | The description | Iran1    | Granada | 2011-01-01   | 1        | Iran             |
	When I request a dotcom playlist for the news video above with no adverts
	Then I should receive a valid playlist
	And there should be no ads