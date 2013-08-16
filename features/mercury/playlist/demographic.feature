@demographic
Feature: DM value to be passed to AI Match for Project Ultra (DN-410)

  Scenario Outline: Demographic value passed through to ad server for supported platforms
    Given I have a piece of <platform> catchup content
    And a demographic value is provided
    When I request the Mercury playlist
    Then the same demographic value should be passed to the ad server

    Examples:
      | platform |
      | DotCom   |
      | Mobile   |

  Scenario Outline: No demographic value passed through to ad server for supported platforms
    Given I have a piece of <platform> catchup content
    But no demographic value is provided
    When I request the Mercury playlist
    Then a default demographic value should be passed to the ad server

    Examples:
      | platform |
      | DotCom   |
      | Mobile   |

  Scenario Outline: No demographic value passed through to ad server for non-supported platforms
    Given I have a piece of <platform> catchup content
    When I request the Mercury playlist
    Then the default non-supported platform demographic value should be passed to the ad server

    Examples:
      | platform |
      | Android  |
      | Samsung  |
      | PS3      |
      | YouView  |

  @freetext
  Scenario Outline: Adcall freetext value passed to ad server for all platforms
    Given I have a piece of <platform> catchup content
    And an <adcallfreetext> value is provided
    When I request the Mercury playlist
    Then the same <adcallfreetext> value is passed to the ad server

    Examples:
      | platform | adcallfreetext |
      | Android  | foo            |
      | Samsung  | foo            |
      | PS3      | foo            |
      | YouView  | foo            |
      | Android  | foo=bar        |
      | Samsung  | foo=bar        |
      | PS3      | foo=bar        |
      | YouView  | foo=bar        |
      | Android  | foo=bar/baz=qux|
      | Samsung  | foo=bar/baz=qux|
      | PS3      | foo=bar/baz=qux|
      | YouView  | foo=bar/baz=qux|

  #cannot test the presence of 'nothing' in an automated test
  @manual
  Scenario Outline: No Adcall freetext value passed to ad server for all platforms
    Given I have a piece of <platform> catchup content
    And no adcall freetext value is provided
    When I request the Mercury playlist
    Then no adcall freetext value is passed to the ad server

    Examples:
      | platform |
      | Android  |
      | Samsung  |
      | PS3      |
      | YouView  |

  @freetext
  Scenario Outline: Adcall freetext containing disallowed characters passed to ad server for all platforms
    Given I have a piece of <platform> catchup content
    And an <adcallfreetext> value is provided
    When I request the Mercury playlist
    Then a <sanitized> value is passed to the ad server

    Examples:
      | platform | adcallfreetext | sanitized |
      | Android  | @£$%           | nil       |
      | Samsung  | @£$%           | nil       |
      | PS3      | @£$%           | nil       |
      | YouView  | @£$%           | nil       |
      | Android  | @foo£$         | .foo      |
      | Samsung  | @foo£$         | .foo      |
      | PS3      | @foo£$         | .foo      |
