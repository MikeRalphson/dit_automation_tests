@not_implemented
@manual

Feature: Android Platfrom avaliable in Bloom CMS
	So that the Android app can consume content
	As Bloom
	I want to manage the Android platform


Scenario: Android playlist through Bloom UI
	Given I am logged onto Bloom
	When I search for a Android vodcrid
	Then I should get a Android playlsit reponse

Scenario: Android platform drop-down through Bloom UI
	Given I am logged onto Bloom
	When I am within the search video page
	Then I should see Android in the Consumer Drop-down 
	And I Should see Android in the Featured Catchup drop-down menu

Scenario: Lower bitrates (150, 300) are available through Bloom UI
	Given I am logged onto Bloom
	When I search for a Android vodcrid
	And I click the edit button
	Then I should see all six Android Bitrates avaliable (150, 300, 400, 600, 800, 1200)

Scenario: ingest content and check availability in Bloom UI
	Given the assets are successfully stored on Origin / Net Storage
	And metadata has been processed successfully by BizTalk 
	And I am logged onto Bloom
	When I search for the ingested content
	Then my content is available within video search screen
	