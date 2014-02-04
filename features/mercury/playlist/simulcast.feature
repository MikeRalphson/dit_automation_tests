@simulcast
Feature: Mercury Simulcast Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury simulcast playlists

  Scenario Outline: Verify simulcast playlist
    Given I have a piece of DotCom catchup content
    When I request a simulcast playlist for <channel>
    Then I should get a video type of simulcast
    And I should get the correct vodcrid back
    And I should receive a valid playlist containing 3 streams
    And I should get the correct base URL in the response

  Examples:
    | channel |
    | itv1    |
    | itv2    |
    | itv3    |
    | itv4    |
    | citv    |
