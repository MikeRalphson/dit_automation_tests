@not_local
Feature: Adverts in Playlist
  In order to display adverts in videos
  As a client
  I want to be able to get ad server urls in playlist response

  Scenario Outline: Ad-server for Mercury playlists
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist
    Then the advert URIs should exist
    And the advert URIs should contain the 'size' tag with the default size
    And the advert URIs should contain the 'area' tag with the correct area
    And the advert URIs should contain the 'site' tag with the correct site
    And the advert URIs should contain the 'generic' tag with same GUID for each URI
    And the advert URIs should contain the 'pv' tag with the correct player version
    And the advert URIs should contain the 'prodid' tag with the correct production ID
    And the advert URIs should contain the 'tparts' tag with the correct number of programme parts
    And the advert URIs should contain the 'owner' tag with a placeholder value
    And the advert URIs should contain the 'series' tag with the correct series

  Examples:
    | platform |
    | DotCom   |
    | Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |
#    | Freesat  |
#TODO: fix Freesat
