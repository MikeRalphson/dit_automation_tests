@not_implemented
@manual

Feature: AOIA-2 Biztalk ingest from Syndication & Netstorage
  So that BizTalk can consume metadata from RBM or Syndication for Android
  As ITV
  I want BizTalk to accept the Android Platfrom

  Scenario Outline: BizTalk processes correct metadata
    Given I have valid metadata from Syndication for <platform>
    When BizTalk processes the metadata into Bloom
    Then BizTalk will generate a success receipt

  Examples:
    | platform |
    | android  |

  Scenario: BizTalk processes incorrect metadata
    Given I have invalid android metadata from Syndication
    When BizTalk validates the metadata
    Then BizTalk will generate a failure receipt

  Scenario Outline: BizTalk receives metadata with a null filesize value for Android
    Given I have valid metadata from Syndication for <platform>
    And the metadata has a null filesize value
    When Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform |
    | android  |


  Scenario Outline: BizTalk receives metadata with a null checksum value for Android
    Given I have valid metadata from Syndication for <platform>
    And the metadata has a null checksum value
    When Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform |
    | android  |


  Scenario Outline: BizTalk receives metadata with a null published location for Android
    Given I have valid metadata from Syndication for <platform>
    And the metadata has a null published location value
    When Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform |
    | android  |

  Scenario: BizTalk receives metadata with a null filesize value for platforms other than Android

  Scenario: BizTalk receives metadata with a null checksum value for platforms other than Android

  Scenario: BizTalk receives metadata with a null published location for platforms other than Android

# lapsed expiry date




