Feature: Mercury Additional Parameters
  So that the ad-server knows the Android device to return ads
  As Mercury
  I want to receive a description of the client device to be included in the ad call

  Scenario: Mercury receives null additional parameter values for Android
    Given I have a piece of Android catchup content
    And I have null additional parameters for non-nullable elements
    When I request the Mercury playlist
    Then the response contains ad-server URL's with empty additional parameter values other than mandatory elements

  Scenario: Mercury receives null additional parameters for platforms excluding Android
    Given I have a piece of Mobile catchup content
    And I have null additional parameters for non-nullable elements
    When I request the Mercury playlist
    Then the response should contain ad-server URL's with no additional parameters

  Scenario: Mercury receives additional parameters for Android
    Given I have a piece of Android catchup content
    And I have valid additional parameters
    When I request the Mercury playlist
    Then the response should contain ad-server URL's with correctly appended additional parameters

  Scenario: Mercury receives additional parameters for platforms excluding Android
    Given I have a piece of Mobile catchup content
    And I have valid additional parameters
    When I request the Mercury playlist
    Then the response should contain ad-server URL's with no additional parameters

  Scenario: Mercury receives additional parameters with values over 100 characters
    Given I have a piece of Android catchup content
    And I have an additional parameter over 100 characters long
    When I request the Mercury playlist
    Then the response should contain ad-server URL's with truncated additional parameters

  Scenario: Mercury receives additional parameters with special characters excluding letters, numbers and dots
    Given I have a piece of Android catchup content
    And I have an additional parameter containing special characters
    When I request the Mercury playlist
    Then the response should contain dots for special characters in the ad-server URL's

  Scenario: Mercury receives additional parameters in uppercase
    Given I have a piece of Android catchup content
    And I have an additional parameter in uppercase
    When I request the Mercury playlist
    Then the response should contain lowercase characters in the ad-server URL's

  @bug
  Scenario: Mercury receives invalid request (additional params out of sequence)
    Given I have a piece of Android catchup content
    And I have additional parameters out of sequence
    When I request the Mercury playlist
    Then the the response should be a SOAP fault with an appropriate error message

  @mobile-bitrate
  Scenario: Mercury receives additional query string parameter
    Given I have a piece of Mobile catchup content
    When I request the Mercury playlist
    Then the response should contain in the Akamai URL query stream the preferred bit rate set to 400

