@local_only
Feature: Ensure Transmission Slot Is Present in GetFileMetadata Response from Bloom DN-317
    As Nxtera, I want to receive the "Transmission Slot" in all asset notification requests sent from BizTalk

    Scenario: Ingest Catchup Data into Bloom, ensure transmission slot is returned
        Given I ingest "DotCom" metadata with "CATCHUP" assets into Bloom
        When I request file metadata for the assets
        Then I should see the correct transmission slot in the response

    Scenario: Ingest Catchup Data into Bloom with no tranmission slot, ensure transmission slot is returned
        Given I ingest "DotCom" metadata with "CATCHUP" assets into Bloom with no transmission slot
        When I request file metadata for the assets
        Then I should not see the correct transmission slot in the response
