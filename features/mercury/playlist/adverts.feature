Feature: Adverts in Playlist
  In order to display adverts in videos
  As a client
  I want to be able to get ad server urls in playlist response

  @not_local
  Scenario Outline: Ad-server for Mercury playlists
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist
    Then the advert URI's should exist
    And the advert URI's should contain the default size
    And the advert URI's should contain the correct area
    And the advert URI's should contain the correct site

  Examples:
    | platform |
    | DotCom   |
    | Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |
    | Freesat  |
