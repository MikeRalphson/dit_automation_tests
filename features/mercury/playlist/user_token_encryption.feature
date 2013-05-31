@sso
@not_local
@irdeto
Feature: PDFT-2791 - Decrypted User Token on playlist request
  So that our HDS content is secure and not open to hackers
  As Mercury
  I want to decrypt the user token that is sent from the Drupal site and send the contents to Irdeto.

  Scenario: Playlist request for catchup (not signed in)
    Given I have a piece of DotCom catchup content
    And a user who is not signed in
    When I request the Mercury playlist
    Then I get the correct production
    And there should be a Session ID of 0 in the response

  Scenario: Playlist request for catchup (signed in)
    Given I have a piece of DotCom catchup content
    And a user who is signed in
    When I request the Mercury playlist
    Then I get the correct production
    And there should be a Session ID of 0 in the response

  Scenario: Initial playlist request for archive (signed in + pay)
    Given I have a piece of DotCom archive content
    And a user who is signed in
    When I request the Mercury playlist
    Then I get the correct production
    And there should be a valid Session ID in the response

  Scenario: Subsequent playlist request for archive (signed in + pay)
    Given I have a piece of DotCom archive content
    And a user who is signed in
    And the user has previously requested the Mercury playlist for that content
    When the user makes a subsequent Mercury playlist request
    Then I get the correct production
    And the response should retain the same Session ID

  Scenario: Subsequent playlist request for catchup after purchasing content (signed in)
    Given a signed in user who has previously requested the Mercury playlist for DotCom archive content
    And I have a piece of DotCom catchup content
    When I request the Mercury playlist
    Then I get the correct production
    And there should be a Session ID of 0 in the response

  Scenario: Mercury request and UserToken production ID's are mismatched
    Given I have a piece of DotCom archive content
    And the requested production ID does not match the one in the UserToken
    When I request the Mercury playlist
    Then the mismatched production ID error message is returned

  Scenario: Decryption failure
    Given I have a piece of DotCom archive content
    And I have an undecryptable UserToken
    When I request the Mercury playlist
    Then the decryption failure error message is returned

  Scenario: Deserialisation failure
    Given I have a piece of DotCom archive content
    And I have a valid but malformed UserToken
    When I request the Mercury playlist
    Then the deserialisation failure error message is returned

  Scenario: User token timestamp has expired
    Given I have a piece of DotCom archive content
    And I have an expired UserToken
    When I request the Mercury playlist
    Then the timestamp has expired error message is returned

  Scenario: User token not passed for Archive content
    Given I have a piece of DotCom archive content
    And I have no UserToken
    When I request the Mercury playlist
    Then the authorisation failure or content unavailable error (depending on the logging level) is returned

  Scenario Outline: Playlist request for archive content containing a UserToken
    Given I have a piece of DotCom archive content
    When I request the Mercury playlist from a different <platform>
    Then the content unavailable for this platform error message is returned

  Examples:
    | platform |
    | Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |
