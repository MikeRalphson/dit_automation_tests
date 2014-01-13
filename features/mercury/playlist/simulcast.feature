@simulcast
Feature: Mercury Simulcast Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury simulcast playlists

  Scenario Outline: Verify simulcast playlist
    Given I have a piece of <platform> catchup content
    When I request a simulcast playlist using <vodcrids>
    Then I should get a video type of simulcast in the response
    Then i should get the correct streams for the correct <channel>
    Then I should get the same vodcrid as <vodcrids>

    Examples:
      | platform | vodcrids | channel |
      | DotCom   | sim2     | itv2    |
      | DotCom   | sim3     | itv3    |
    # | Android  | sim2     | itv2    |
    # | Android  | sim3     | itv3    |
