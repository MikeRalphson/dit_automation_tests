@not_implemented

Feature: Lithium Playlist
	So that we can access videos from the Lithium pipeline
	As ITV 
	I want to be able to request Lithium videos from the Mercury Playlist Service

Scenario: DN-114 - Pre-roll and Post-roll ads - Request a video with adverts
	Given a Lithium video is available
	When I request a Lithium playlist for the video above with adverts and with area 'sport.football.euro2012.article/position=1/size=728x90'
	Then I should receive a valid playlist
	And the Lithium playlist should contain 2 pre-roll and 2 post-roll ad calls
	And the area is included in the ad call URL

Scenario: DN-114 - Pre-roll and Post-roll ads - Request a video with no adverts
	Given a Lithium video is available
	When I request a Lithium playlist for the video above with no adverts
	Then I should receive a valid playlist
	And there should be no ads

Scenario: DN-115 Geoblocking - Request a geoblocked video from outside the UK
	Given a Lithium video is available with IsGeoblocked set to true
	When I request a Lithium playlist for the video from outside the UK
	Then I should receive a NonNull soap exception with the message 'The client is in a geographical region that does not have access to the content'

Scenario: DN-115 Geoblocking - Request a geoblocked video from inside the UK
	Given a Lithium video is available with IsGeoblocked set to true
	When I request a Lithium playlist for the video from inside the UK
	Then I should receive a valid playlist

Scenario: DN-116 Encryption - Request an playlist with HLS stream type
	Given a Lithium video is available 
	When I request a Lithium playlist for HLS
	Then I should receive a valid playlist
	And the playlist should be for HLS
	
Scenario: DN-116 Encryption - Request an playlist with no stream type
	Given a Lithium video is available
	When I request a Lithium playlist with no stream type
	Then I should receive a valid playlist
	And the playlist should be for RTMPE stream type
	