@simulcast
Feature: Mercury Simulcast Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury simulcast playlists

  Scenario Outline: Verify simulcast playlist
    Given I have a piece of <platform> catchup content
    When I request a simulcast playlist using <vodcrid>
    Then I should get a video type of simulcast in the response
    Then I should get the same vodcrid as <vodcrid>
    Then I should receive a valid playlist containing 3 <streams> and the <base_url>

    Examples:
      | platform | vodcrid | streams                                                                  | base_url                             |
      | DotCom   | sim2    | itv2livefms_600@172813, itv2livefms_800@172813, itv2livefms_1200@172813  | rtmpe://cp273989.live.edgefcs.net/live|
#      | DotCom   | sim3     | itv3    |
#      | Android  | sim2     | itv2    |
#      | Android  | sim3     | itv3    |
