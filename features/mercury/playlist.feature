@playlist
Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic request
    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then I get the requested <vodcrid>
    And the expiry date is in the future
    And I get the correct bitrate based on the <platform>
    And I get the correct base url
  # And I get the correct video type

  Examples:
    | vodcrid | platform |
    | 301871  | DotCom   |
    | 301871  | Mobile   |
    | 301871  | Samsung  |
    | 301871  | PS3      |
    | 301871  | YouView  |
    #| 301871  | Freesat  |


@not_implemented
  Scenario Outline: Geo-blocking for Mercury playlists
    Given I request the Mercury playlist from <location>
    Then I get the requested <response>
    
  Examples:
    | location | response |
    | 301871   | success  |
    | 301871   | blocked  | 
    
    #REAL_CLIENT_IP
    