@not_implemented
Feature: Mercury Additional Parameters
  So that the ad-server knows the Android device to return ads
  As Mercury
  I want to receive a description of the client device to be included in the ad call

# should default to the normal way of doing things
  Scenario: Mercury receives no additional parameters for Android
    Given I request the Mercury playlist for <platform> with no additional parameters
    Then the response should contain ad-server URL's with no additional parameters / empty values

# should default to the normal way of doing things? or pass through null values?
  Scenario: Mercury receives no additional parameters for Android
    Given I request the Mercury playlist for <platform> with null additional parameter values
    Then the response should contain ad-server URL's with no additional parameters / empty values

  #------------------------------------------------------------------------------

# already covered in regression (same as scenario 1)
  Scenario: Mercury receives no additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> with no additional parameters
    Then the response should contain ad-server URL's with no additional parameters / empty values

# should default to the normal way of doing things? or pass through null values? (same as scenario 2)
  Scenario: Mercury receives no additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> with null additional parameter values
    Then the response should contain ad-server URL's with no additional parameters / empty values

  #------------------------------------------------------------------------------

# should append additional parameters to advert URL's correctly
  Scenario: Mercury receives additional parameters for Android
    Given I request the Mercury playlist for <platform> with additional parameters
    Then the response should contain ad-server URL's with correctly appended additional parameters

# should pass them through too and let the adserver decide what to do (same as scenario above)
  Scenario: Mercury receives additional parameters for platforms excluding Android
    Given I request the Mercury playlist for <platform> with additional parameters
    Then the response should contain ad-server URL's with correctly appended additional parameters

# not sure if we can achieve this (100 chars * x? parameters)
  Scenario: Mercury receives additional parameters that are collectively too long
    Given I request the Mercury playlist for <platform> with all additional parameters over 100 characters long
    Then the response should contain ad-server URL's with truncated additional parameters according to priority

# should truncate to 100 characters in the returned advert URL
  Scenario: Mercury receives additional parameters with values over 100 characters
    Given I request the Mercury playlist for <platform> with additional parameters over 100 characters long
    Then the response should contain ad-server URL's with truncated additional parameters

# should map special characters to dots
  Scenario: Mercury receives additional parameters with special characters excluding letters, numbers and dots
    Given I request the Mercury playlist for <platform> with additional parameters containing special characters
    Then the response should contain dots for special characters in the ad-server URL's

# not sure if we need this or it's just a convention
  Scenario: Mercury receives additional parameters not in lowercase
    Given I request the Mercury playlist for <platform> with additional parameters in uppercase
    Then the response should contain lowercase characters in the ad-server URL's
