@playlist

Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic playlist request
    Given I request the Mercury playlist for <platform> and <media>
    Then I get the requested id for <platform> and <media>
    And the expiry date is in the future
    And I get the correct bitrate based on the <platform>
    And I get the correct base url based on the <platform>
    And I get the correct video type based on the <platform>

  Examples:
    | platform | media |
    | DotCom   | rtmpe |
    | Android  | rtmpe |
    | Mobile   | rtmpe |
    | Samsung  | rtmpe |
    | PS3      | rtmpe |
    | YouView  | rtmpe |

  @not_local
  Scenario Outline: Verify a HDS playlist request that contains a manifest url
    Given I request the Mercury playlist for <platform> and <media>
    Then I get the requested HDS prodid
    And the expiry date is in the future
    And I get the correct ManifestFile url based on the <platform>

  Examples:
    | platform | media |
    | DotCom   | f4m   |

  Scenario Outline: Geo-blocking for Mercury playlists status sucess
    Given I request the Mercury playlist from <location> with vodcrid <media> and <platform>
    Then I get the expected <response> status for that vodcrid

  Examples:
    | platform | location      | response | media |
    | DotCom   | 10.192.42.109 | success  | rtmpe |
    | DotCom   | 10.192.42.109 | success  | f4m   |
    | Android  | 10.192.42.109 | success  | rtmpe |
    | Mobile   | 10.192.42.109 | success  | rtmpe |
    | Samsung  | 10.192.42.109 | success  | rtmpe |
    | PS3      | 10.192.42.109 | success  | rtmpe |
    | YouView  | 10.192.42.109 | success  | rtmpe |

  @not_local
  Scenario Outline: Geo-blocking for Mercury playlists status blocked
    Given I request the Mercury playlist from <location> with vodcrid <media> and <platform>
    Then I get the expected <response> status for that vodcrid

  Examples:
    | platform | location     | response | media |
    | DotCom   | 194.4.55.200 | blocked  | rtmpe |
    | DotCom   | 194.4.55.200 | blocked  | f4m   |
    | Android  | 194.4.55.200 | blocked  | rtmpe |
    | Mobile   | 194.4.55.200 | blocked  | rtmpe |
    | Samsung  | 194.4.55.200 | blocked  | rtmpe |
    | PS3      | 194.4.55.200 | blocked  | rtmpe |
    | YouView  | 194.4.55.200 | blocked  | rtmpe |

  @not_local
  Scenario Outline: Ad-server for Mercury playlists
    Given I request the Mercury playlist for <platform> and <media>
    Then the advert URI should contain the correct size
    And the advert URI should contain the correct area
    And the advert URI should contain the correct site based on the <platform>

  Examples:
    | platform | media |
    | DotCom   | rtmpe |
    | DotCom   | f4m   |
    | Android  | rtmpe |
    | Mobile   | rtmpe |
    | Samsung  | rtmpe |
    | PS3      | rtmpe |
    | YouView  | rtmpe |

  Scenario: Verify Freesat playlist request
    Given I request a Freesat Mercury playlist with vodcrid
    Then I get the requested vodcrid in the response

  @not_local
  Scenario Outline: Verify correct Adverts for a Freesat playlist request
    Given I request a Freesat Mercury playlist with vodcrid
    Then the advert URI should contain the correct <size> and <site>

  Examples:
    | size         | site        |
    | videofreesat | itv.freesat |

  @stings
  Scenario Outline: Sting verification for non-Android and non-YouView platforms
    Given I request the Mercury playlist for <platform> and <media>
    Then I get a single .mp4 sting with a bitrate of 0

  Examples:
    | platform | media |
    | DotCom   | rtmpe |
    | Mobile   | rtmpe |
    | Samsung  | rtmpe |
    | PS3      | rtmpe |

  @stings
  Scenario Outline: Sting verification for YouView
    Given I request the Mercury playlist for <platform> and <media>
    Then I get a single .ts sting with a bitrate of 0

  Examples:
    | platform | media |
    | YouView  | rtmpe |

  @stings
  Scenario Outline: Sting verification for Android
    Given I request the Mercury playlist for <platform> and <media>
    Then I get two .mp4 stings with bitrates of 300 and 600

  Examples:
    | platform | media |
    | Android  | rtmpe |
