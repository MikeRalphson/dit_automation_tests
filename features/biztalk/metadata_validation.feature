@not_implemented
Feature: BizTalk Metadata Validation
  So that BizTalk can consume metadata from RBM or Syndication for Android
  As BizTalk
  I want to ensure that metadata is validated for errors


  Scenario: The Copyright Notice value has a character limit of 1000.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Guidance Text value has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The ITV Age Rating value has a character limit of 10.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Language value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Language value has a character limit of 20.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Brand value has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The License Type value must be a value of “Fixed Dates” or “First TX”.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Cost Code value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Cost Code value has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Ad Rule must have a value of “ALWAYS”, “NEVER” or “UNSPECIFIED”.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Start Of Availability date must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Start Of Availability date must occur before the End Of Availability date.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The End Of Availability date must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

    # duplication?
  Scenario: The End Of Availability date must occur after the Start Of Availability date.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:EpisodeOf/@index value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:MemberOf/@index value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Part Number or Break Number value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: The Platform value should be one of “DOTCOMITVC”, “FREESATITVC”, "ANDROIDITVC", “PS3ITVC”, “CANVASITVC”, “MOBILEITVC” or "SAMSUNGSAMSUNG".
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:SlotChannel has a character limit of 10.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: @firstName has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: @lastName has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:Filename has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:FileSize value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:Profile value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:AspectRatio must be a value of “Flat + 1.33”, “Flat + 1.78”, “Flat +1.85”, “Flat +2.35”, “Flat +Other”, “Anamorphic +1.78”, “Anamorphic +1.85”, “Anamorphic +2.35”, “Anamorphic +other”, “4x3”, “4x3 Letterbox” or “16x9”.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:FrameRate value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:Coding/tva:Name value must be present and has a character limit of 100.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:MD5Checksum has a character limit of 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:Keyword has a character limit of 100.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:Genre/tva:Name has a character limit of 100.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:shortSynopsis has a character limit of between 1 and 255.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:longSynopsis has a character limit of 1000.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:longRunningSeries value must be present.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)

  Scenario: tva:Duration value must be greater than 0.
    Given I have metadata from Syndication for <platform>
    And the metadata has (...)
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt stating that (...)
