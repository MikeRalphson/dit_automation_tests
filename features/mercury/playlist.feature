@playlist
Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic request
    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then I get the requested <vodcrid>
  #    And I get the correct base url
  #    And I get the correct Bitrates types
  #    And I get the correct video type
    And the expiry date is in the future

  Examples:
    | vodcrid | platform |
    | 302607  | DotCom   |
