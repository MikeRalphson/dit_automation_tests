@sso
@not_local
@not_rc3

Feature: PDFT-2791 - Decrypted User Token on playlist request
  So that our HDS content is secure and not open to hackers
  As Mercury
  I want to decrypt the user token that is sent from the Drupal site and send the contents to Irdeto.

  Scenario Outline: Playlist request for catchup (not signed in)
    Given a user who is not signed in
    When the user makes an initial <platform> playlist request for the catchup content
    Then there is a valid playlist response for catchup content
    And the response should contain an Irdeto SessionId of 0

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Playlist request for catchup (signed in)
    Given a user who is signed in
    When the user makes an initial <platform> playlist request for the catchup content
    Then there is a valid playlist response for catchup content
    And the response should contain an Irdeto SessionId of 0

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Initial playlist request for archive (signed in + pay)
    Given a user who is signed in and has a valid UserToken
    When the user makes an initial <platform> playlist request for the archive content
    Then there is a valid playlist response for archive content
  #    And the response should contain a valid Irdeto SessionId
  #    ** REMOVED UNTIL AUTOMATED RENTAL JOURNEY FOR PAY HAS BEEN IMPLEMENTED

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Subsequent playlist request for archive (signed in + pay)
    Given a user who is signed in and has a valid UserToken
    And has previously requested <platform> archive content
    When the user makes a subsequent <platform> playlist request for the archive content
    Then there is a valid playlist response for archive content
    And the response should retain the Irdeto SessionId

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Subsequent playlist request for catchup after purchasing content (signed in)
    Given a user who is signed in and has a valid UserToken
    And has previously requested <platform> archive content
    When the user makes a subsequent <platform> playlist request for the catchup content
    Then there is a valid playlist response for catchup content
    And the response should contain an Irdeto SessionId of 0

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Invalid production ID
    Given a request for archive content containing a mismatched production id in the UserToken
    When the user makes an initial <platform> playlist request for the archive content
    Then the invalid production id error message is returned

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Decryption failure
    Given a request for archive content containing a malformed UserToken
    When the user makes an initial <platform> playlist request for the archive content
    Then the decryption failure error message is returned

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Deserialisation failure
    Given a request for archive content containing a malformed JOSN UserToken
    When the user makes an initial <platform> playlist request for the archive content
    Then the deserialisation failure error message is returned

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: User token timestamp has expired
    Given a request for archive content containing an expired UserToken
    When the user makes an initial <platform> playlist request for the archive content
    Then the timestamp has expired error message is returned

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: User token timestamp is in the future
    Given a request for archive content containing a UserToken in the future
    When the user makes an initial <platform> playlist request for the archive content
    Then the UserToken is in the future error message is returned

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: User token not passed for Archive content
    Given a request for archive content without a UserToken
    When the user makes an initial <platform> playlist request for the archive content
    Then the content unavailable for this platform error message is returned

  Examples:
    | platform |
    | DotCom   |

  Scenario Outline: Playlist request for Archive content contenting a UserToken
    Given a user who is signed in
    When the user makes a <platform> playlist request for the archive content with a UserToken
    Then the content unavailable for this platform error message is returned

  Examples:
    | platform |
    | Android  |
    | Mobile   |
    | Samsung  |
    | PS3      |
    | YouView  |

  @manual
  Scenario: Feature flag for mandatory DotCom UserToken decryption is off
    Given the feature flag enforcing UserToken decryption for DotCom requests is off
    When the user makes a playlist request for archive content
    Then there is a valid playlist response

  @manual
  Scenario: Feature flag for mandatory DotCom UserToken decryption is on (request rejected)
    Given the feature flag enforcing UserToken decryption for DotCom requests is on
    When the user makes a playlist request for archive content
    And the request does not contain a UserToken
    Then the correct error message is returned
