@wip
@manual


Feature: Biztalk ingest for all platforms
  So that BizTalk can 
  As ITV
  I want BizTalk to Successfully ingest content


Scenario Outline: BizTalk processes correct metadata and Assets
  Given I have valid metadata and assets for <platform>
  When the Metadata has been sent to the correct folder in Biztalk
  And the video assets are sent to the correct folder in Biztalk
  Then BizTalk will generate a success receipt

  Examples: 
  | platform |
  | Dotcom   |
  | samsung  |
  | youview  |
  | mobile   |