@not_implemented

Feature: DN-117 - Simulcast
	So that we can provide Simulcast correctly
	As an ITV Player Developer
	I want the available stream entries

#Scenario: Multiple stream
	#Given there is are three renditions in the database
	#When simulcast playlist is requested
	#Then the single stream will be provided

Scenario Outline: Simulcast streams
	Given there are <Renditions> rendition(s) in the database
	When simulcast playlist is requested
	Then <Streams> stream(s) will be provided

Examples: 
	| Renditions | Streams |
	| 1          | 1       |
	| 3          | 3       |


Scenario: Simulcast not available
	Given a simulcast channel is not available
	When simulcast playlist is requested
	Then an error will be returned
