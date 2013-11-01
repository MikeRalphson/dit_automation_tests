@new-service

Feature: New Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request new playlists

Scenario Outline: Verify new playlist for the new TV platform
  Given I have a piece of <platform> catchup content
  When I request the new playlist service for <platform>
  Then I should get a status code 200
  And I get the correct production ID
  And I should get a valid response for <platform>

Examples:
  | platform    |
  | DotCom      |
  | Android     |
  | Mobile      |
  | Samsung     |
  | PS3         |
  | YouView     |
  | Freesat     |
