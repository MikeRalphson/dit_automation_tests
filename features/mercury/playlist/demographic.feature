@demographic
Feature: demographic

Scenario Outline: demographic value passed through to ad server for supported platforms
	Given I have a piece of <platform> catchup content
	And a demographic value is provided 
	When I request the Mercury playlist
	Then the same demographic value should be passed to the ad server 

  Examples:
    | platform |
    | DotCom   |
    | Mobile   |

Scenario Outline: no demographic value passed through to ad server for supported platforms
	Given I have a piece of <platform> catchup content
	But no demographic value is provided 
	When I request the Mercury playlist
	Then a default demographic value should be passed to the ad server

  Examples:
    | platform |
    | DotCom   |
    | Mobile   |

Scenario Outline: no demographic value passed through to ad server for non-supported platforms
Given I have a piece of <platform> catchup content
When I request the Mercury playlist
Then the default non-supported platform demographic value should be passed to the ad server 

  Examples:
    | platform |
    | Android  |
    | Samsung  |
    | PS3      |
    | YouView  |
#   | Freesat  |
