@not_implemented
Feature: AOIA-2 Biztalk ingest from Syndication & Netstorage
  So that BizTalk can consume metadata from RBM or Syndication for Android
  As ITV
  I want BizTalk to accept the Android Platfrom

  Scenario Outline: BizTalk processes correct metadata for Android
    Given I have metadata from Syndication for <platform>
    When I send metadata to BizTalk via <route>
    And BizTalk processes the metadata into Bloom
    Then BizTalk will generate a success receipt

  Examples:
    | platform | route |
    | android  | FTP   |
#    | android  | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null filesize value for Android
    Given I have metadata from Syndication for <platform>
    And the metadata has a null filesize value
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform | route |
    | android  | FTP   |
    | android  | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null checksum value for Android
    Given I have metadata from Syndication for <platform>
    And the metadata has a null checksum value
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform | route |
    | android  | FTP   |
    | android  | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null published location for Android
    Given I have metadata from Syndication for <platform>
    And the metadata has a null published location value
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform | route |
    | android  | FTP   |
    | android  | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null filesize value for platforms other than Android
    Given I have metadata from Syndication for <platform>
    And the metadata has a null filesize value
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform | route |
    | dotcom   | FTP   |
    | dotcom   | HTTP  |
    | ps3      | FTP   |
    | ps3      | HTTP  |
    | mobile   | FTP   |
    | mobile   | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null checksum value for platforms other than Android
    Given I have metadata from Syndication for <platform>
    And the metadata has a null checksum value
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform | route |
    | dotcom   | FTP   |
    | dotcom   | HTTP  |
    | ps3      | FTP   |
    | ps3      | HTTP  |
    | mobile   | FTP   |
    | mobile   | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null published location for platforms other than Android
    Given I have metadata from Syndication for <platform>
    And the metadata has a null published location value
    When I send metadata to BizTalk via <route>
    And Biztalk validates the metadata
    Then BizTalk will generate a failure receipt

  Examples:
    | platform | route |
    | dotcom   | FTP   |
    | dotcom   | HTTP  |
    | ps3      | FTP   |
    | ps3      | HTTP  |
    | mobile   | FTP   |
    | mobile   | HTTP  |

# lapsed expiry date
