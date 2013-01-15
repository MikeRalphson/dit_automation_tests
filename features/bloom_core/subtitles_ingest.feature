@local_only
Feature: Ingest subtitles into Bloom using the MetaIngestService DN-295
  As BizTalk
  I want to be able to ingest subtitles into Bloom
  So that they are available in playlists

  Scenario: Ingest subtitles for a production
    Given I have a production for the "DotCom" platform
    And I ingest with subtitles
    When I request the playlist for the production
    Then the response should contain the path to the subtitles

  Scenario: Subsequent ingest updates subtitles
    Given I have already ingested a "DotCom" production with subtitles
    And I ingest again for the same production with an updated subtitles file
    When I request the playlist for the production
    Then the response should contain a single subtitles file
    And the response should contain the path to the updated file
