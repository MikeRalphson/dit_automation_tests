@not_i01
@simulcast
Feature: Mercury Simulcast Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury simulcast playlists

  Scenario Outline: Verify simulcast playlist
    Given I have a piece of <platform> catchup content
    When I request a simulcast playlist using <vodcrid>
    Then I should get a video type of simulcast
    Then I should get <vodcrid> in the response
    Then I should receive a valid playlist containing 3 <stream_id> with <channel>
    Then I should get the <base_url>

    Examples:
       | platform | vodcrid | channel | stream_id | base_url                               |
#      | DotCom   | sim1    | itv1    | s172940   | rtmpe://cp274438.live.edgefcs.net/live |
       | DotCom   | sim2    | itv2    | s172813   | rtmpe://cp273989.live.edgefcs.net/live |
       | DotCom   | sim3    | itv3    | s172816   | rtmpe://cp273990.live.edgefcs.net/live |
#      | DotCom   | sim4    | itv4    | s172941   | rtmpe://cp274439.live.edgefcs.net/live |
#      | DotCom   | sim7    | citv    | s172943   | rtmpe://cp274440.live.edgefcs.net/live |
