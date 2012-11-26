@android_ingest

Feature: AOIA-2 BizTalk ingest from Syndication & Net Storage
  So that BizTalk can consume metadata from RBM or Syndication for Android
  As ITV
  I want BizTalk to accept the Android Platform

  Scenario Outline: BizTalk processes correct metadata for all platforms
    Given I have metadata from Syndication for <platform>
    When I send metadata to BizTalk via <route>
    And BizTalk validates the metadata
    Then BizTalk will generate a success receipt

  Examples:
    | platform | route |
    | android  | FTP   |
    | android  | HTTP  |
    | dotcom   | FTP   |
    | dotcom   | HTTP  |
    | ps3      | FTP   |
    | ps3      | HTTP  |
    | mobile   | FTP   |
    | mobile   | HTTP  |
    | samsung  | FTP   |
    | samsung  | HTTP  |
    | freesat  | FTP   |
    | freesat  | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null filesize value for all platforms
    Given I have metadata from Syndication for <platform>
    And the metadata has a null filesize value
    When I send metadata to BizTalk via <route>
    And BizTalk validates the metadata
    Then BizTalk will generate a success receipt

  Examples:
    | platform | route |
    | android  | FTP   |
    | android  | HTTP  |
    | dotcom   | FTP   |
    | dotcom   | HTTP  |
    | ps3      | FTP   |
    | ps3      | HTTP  |
    | mobile   | FTP   |
    | mobile   | HTTP  |
    | samsung  | FTP   |
    | samsung  | HTTP  |
    | freesat  | FTP   |
    | freesat  | HTTP  |


  Scenario Outline: BizTalk receives metadata with a null checksum value for all platforms
    Given I have metadata from Syndication for <platform>
    And the metadata has a null checksum value
    When I send metadata to BizTalk via <route>
    And BizTalk validates the metadata
    Then BizTalk will generate a success receipt

  Examples:
    | platform | route |
    | android  | FTP   |
    | android  | HTTP  |
    | dotcom   | FTP   |
    | dotcom   | HTTP  |
    | ps3      | FTP   |
    | ps3      | HTTP  |
    | mobile   | FTP   |
    | mobile   | HTTP  |
    | samsung  | FTP   |
    | samsung  | HTTP  |
    | freesat  | FTP   |
    | freesat  | HTTP  |
