@not_implemented
@manual


Feature: AOIA-2 Biztalk ingest from Syndication & Netstorage
	So that BizTalk can consume metadata from RBM or Syndication for Android
	As ITV
	I want BizTalk to accept the Android Platfrom


Scenario: BizTalk processes correct metadata
	Given I have valid metadata from Syndication
	When BizTalk processes the metadata into Bloom
	Then BizTalk will generate a success receipt

Scenario: BizTalk processes incorrect metadata
	Given I have invalid metadata from Syndication
	When BizTalk validates the metadata 
	Then BizTalk will generate a failure receipt
