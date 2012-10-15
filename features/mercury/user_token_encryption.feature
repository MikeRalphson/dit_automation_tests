@wip

Feature: PDFT-2791 - Decrypted UserToken on playlist request 
    So that a createSession call can be made
    GIVEN a new playlist request for HDS content
    WHEN a playlist request is made for archive content
    THEN decrypt the user token

    Scenario: Playlist request for catchup (not signed in)
        Given a user who is not signed in
        When the user makes a playlist request for catchup content
        Then there is a valid playlist response
        And the response should contain an Irdeto SessionId of 0

    Scenario: Playlist request for catchup (signed in)
        Given a user who is signed in
        When the user makes a playlist request for catchup content
        Then there is a valid playlist response
        And the response should contain an Irdeto SessionId of 0

    Scenario: Initial playlist request for archive (signed in + pay)
        Given a user who is signed in
        When the user makes a playlist request for archive content
        Then there is a valid playlist response
        And the response should contain a valid Irdeto SessionId

    Scenario: Subsequent playlist request for archive (signed in + pay)
        Given a user who is signed in
        And has previously requested archive content
        When the user makes a subsequent playlist request for archive content
        Then there is a valid playlist response
        And the response should retain the Irdeto SessionId

    Scenario: Subsequent playlist request for catchup after purchasing content (signed in)
        Given a user who is signed in
        And has previously requested archive content
        When the user makes a subsequent playlist request for catchup content
        Then there is a valid playlist response
        And the response should retain the Irdeto SessionId

    Scenario: Invalid production ID
        Given a request for archive content containing a mismatched production id in the UserToken
        When the user makes a playlist request for the archive content
        Then the correct error message is returned

    Scenario: Decryption failure
        Given a request for archive content containing a malformed UserToken
        When the user makes a playlist request for the archive content
        Then the correct error message is returned

    Scenario: User token timestamp has expired
        Given a request for archive content containing an expired UserToken
        When the user makes a playlist request for the archive content
        Then the correct error message is returned

    Scenario: User token timestamp is in the future 
        Given a request for archive content containing a UserToken in the future
        When the user makes a playlist request for the archive content
        Then the correct error message is returned??

    Scenario: Feature flag for UserToken decryption is off
