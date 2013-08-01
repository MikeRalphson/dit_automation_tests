@playlist @youview_cdn
Feature: YouView playlists contain CDN information
  In order to select the correct CDN
  As the YouView ITV player
  I want to be able to receive CDN specific video URL's in playlist responses

  Scenario: Verify CDN specific video URL's
    Given I have a piece of YouView catchup content
    When I request the Mercury playlist
    Then I get the correct CDN video URL's

  Scenario: Verify CDN ID attributes
    Given I have a piece of YouView catchup content
    When I request the Mercury playlist
    Then I get the correct ID attributes for each CDN
