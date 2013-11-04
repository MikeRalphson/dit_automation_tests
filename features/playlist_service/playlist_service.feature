@new-service
Feature: New Playlist Rest Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request new playlists

Scenario Outline: Verify new playlist for the new TV platform
  Given I have a piece of <platform> catchup content
  When I request the new playlist service
  Then I should get a valid status code
  And I get the correct production ID

Examples:
  | platform    |
  | DotCom      |
  | Android     |
  | Mobile      |
  | Samsung     |
  | PS3         |
  | YouView     |
  | Freesat     |
