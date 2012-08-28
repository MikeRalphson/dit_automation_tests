@playlist
Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic request

    Given I request the Mercury playlist with <vodcrid> and <platform>
    Then I get a successful response

  Examples:
    | vodcrid | platform |
    | 298685  | DotCom   |
