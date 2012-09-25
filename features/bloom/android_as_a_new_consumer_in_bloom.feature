@not_implemented
@manual

Feature: AOIA-3 Android Platfrom available in Bloom CMS
	So that the Android app can consume content
	As Bloom
	I want to manage the Android platform

Scenario: Android playlist through Bloom UI
	Given I am logged onto Bloom
	When I search for an Android vodcrid
	Then I should get an Android playlist response

Scenario: Android platform drop-down through Bloom UI
	Given I am logged onto Bloom
	When I am within the search video page
	Then I should see Android in the Consumer drop-down
	And I should see Android in the Featured Catchup drop-down

Scenario: Lower bitrates (150, 300) are available through Bloom UI
	Given I am logged onto Bloom
	When I search for an Android vodcrid
	And I click the edit button
	Then I should see all six Android bitrates available (150, 300, 400, 600, 800, 1200)

Scenario: Ingest content and check availability in Bloom UI
	Given the assets are successfully stored on Origin / Net Storage
	And metadata has been processed successfully by BizTalk 
	And I am logged onto Bloom
	When I search for the ingested content
	Then my content is available within the video search screen
	