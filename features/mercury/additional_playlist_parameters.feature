@not_live
Feature: Mercury Additional Parameters
  So that the ad-server knows the Android device to return ads
  As Mercury
  I want to receive a description of the client device to be included in the ad call

  Scenario Outline: Mercury receives null additional parameter values for Android
    Given I request the Mercury playlist for <platform> with null additional parameters
    Then the response should contain ad-server URL's with empty additional parameter values other than mandatory elements

  Examples:
    | platform | 
    | Android  |

  Scenario Outline: Mercury receives no additional parameters for Android
    Given I request the Mercury playlist for <platform> without additional parameters
    Then the response should contain ad-server URL's with empty additional parameter values

  Examples:
    | platform |
    | Android  | 

  Scenario Outline: Mercury receives no additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> without additional parameters
    Then the response should contain ad-server URL's with no additional parameters

  Examples:
    | platform |
    | Mobile  |

  Scenario Outline: Mercury receives null additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> with null additional parameters
    Then the response should contain ad-server URL's with no additional parameters

  Examples:
    | platform |
    | Mobile  |

  Scenario Outline: Mercury receives additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> with additional parameters
    Then the response should contain ad-server URL's with no additional parameters

  Examples:
    | platform |
    | Mobile  |

  Scenario Outline: Mercury receives additional parameters for Android
    Given I request the Mercury playlist for <platform> with additional parameters
    Then the response should contain ad-server URL's with correctly appended additional parameters

  Examples:
    | platform |
    | Android  |

  Scenario Outline: Mercury receives additional parameters with values over 100 characters
    Given I request the Mercury playlist for <platform> with additional parameters over 100 characters long
    Then the response should contain ad-server URL's with truncated additional parameters

  Examples:
    | platform |
    | Android  |

  Scenario Outline: Mercury receives additional parameters with special characters excluding letters, numbers and dots
    Given I request the Mercury playlist for <platform> with additional parameters containing special characters
    Then the response should contain dots for special characters in the ad-server URL's

  Examples:
    | platform |
    | Android  |

  Scenario Outline: Mercury receives additional parameters in uppercase
    Given I request the Mercury playlist for <platform> with additional parameters in uppercase
    Then the response should contain lowercase characters in the ad-server URL's

  Examples:
    | platform |
    | Android  |

  Scenario Outline: Mercury receives a subset of additional parameters
    Given I request the Mercury playlist for <platform> with a subset of additional parameters
    Then the response should contain ad-server URL's with correctly appended additional parameters

  Examples:
    | platform |
    | Android  |

    @bug
  Scenario Outline: Mercury receives invalid request (additional params out of sequence)
    Given I request the Mercury playlist for <platform> with additional parameters out of sequence
    Then the the response should be a SOAP Fault with an appropriate error message

  Examples:
    | platform |
    | Android  |
