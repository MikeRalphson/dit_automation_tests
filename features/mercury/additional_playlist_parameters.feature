@not_implemented
Feature: Mercury Additional Parameters
  So that the ad-server knows the Android device to return ads
  As Mercury
  I want to receive a description of the client device to be included in the ad call

# ignore

  Scenario Outline: Mercury receives null additional parameter values for Android
    Given I request the Mercury playlist for <platform> and <vodcrid> with null additional parameters
    Then the response should contain ad-server URL's with empty additional parameter values

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives no additional parameters for Android
    Given I request the Mercury playlist for <platform> and <vodcrid> without additional parameters
    Then the response should contain ad-server URL's with empty additional parameter values

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives no additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> and <vodcrid> without additional parameters
    Then the response should contain ad-server URL's with no additional parameters

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

# ignore

  Scenario Outline: Mercury receives null additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> and <vodcrid> with null additional parameters
    Then the response should contain ad-server URL's with no additional parameters

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> and <vodcrid> with additional parameters
    Then the response should contain ad-server URL's with no additional parameters

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives additional parameters for Android
    Given I request the Mercury playlist for <platform> and <vodcrid> with additional parameters
    Then the response should contain ad-server URL's with correctly appended additional parameters

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives additional parameters with values over 100 characters
    Given I request the Mercury playlist for <platform> and <vodcrid> with additional parameters over 100 characters long
    Then the response should contain ad-server URL's with truncated additional parameters

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives additional parameters with special characters excluding letters, numbers and dots
    Given I request the Mercury playlist for <platform> and <vodcrid> with additional parameters containing special characters
    Then the response should contain dots for special characters in the ad-server URL's

  Examples:
    | platform | vodcrid |
    | android  | 123456  |

  Scenario Outline: Mercury receives additional parameters in uppercase
    Given I request the Mercury playlist for <platform> and <vodcrid> with additional parameters in uppercase
    Then the response should contain lowercase characters in the ad-server URL's

  Examples:
    | platform | vodcrid |
    | android  | 123456  |
