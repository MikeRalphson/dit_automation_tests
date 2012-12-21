@wip
Feature: Digital online graphics
  So that a device can deliver the correct digital online graphic to the user
  As Mercury
  I want the playlist response to include the correct digital online graphic

  Scenario Outline: The ITV1 DOG is always returned regardless of channel for the YouView and Samsung platforms
    Given I request the Mercury playlist for <platform> with a specific <channel>
    Then I should receive a playlist with an ITV1 DOG

  Examples:
    | platform | channel |
    | YouView  | ITV1    |
    | YouView  | ITV2    |
    | YouView  | ITV3    |
    | YouView  | ITV4    |
    | YouView  | CITV    |
    | Samsung  | ITV1    |
    | Samsung  | ITV2    |
    | Samsung  | ITV3    |
    | Samsung  | ITV4    |
    | Samsung  | CITV    |


  Scenario Outline: The channel-specific DOG is returned for all platforms except YouView and Samsung
    Given I request the Mercury playlist for <platform> with a specific <channel>
    Then I should receive a playlist with a DOG matching the <channel>

  Examples:
    | platform | channel |
    | DotCom   | ITV1    |
    | DotCom   | ITV2    |
    | DotCom   | ITV3    |
    | DotCom   | ITV4    |
    | DotCom   | CITV    |
    | PS3      | ITV1    |
    | PS3      | ITV2    |
    | PS3      | ITV3    |
    | PS3      | ITV4    |
    | PS3      | CITV    |
    | Android  | ITV1    |
    | Android  | ITV2    |
    | Android  | ITV3    |
    | Android  | ITV4    |
    | Android  | CITV    |
    | Mobile   | ITV1    |
    | Mobile   | ITV2    |
    | Mobile   | ITV3    |
    | Mobile   | ITV4    |
    | Mobile   | CITV    |


  Scenario Outline: The channel-specific DOG is returned for FreeSat
    Given I request the Mercury playlist for FreeSat with a specific <channel>
    Then I should receive a FreeSat response with a DOG matching the <channel>

  Examples:
    | channel |
    | ITV1    |
    | ITV2    |
    | ITV3    |
    | ITV4    |
#   no CITV for FreeSat
