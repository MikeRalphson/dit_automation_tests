@playlist
Feature: Mercury Playlist Requests
  In order to generate front end features
  As a backend enabler
  I want to be able to request Mercury playlists

  Scenario Outline: Verify basic request

    Given I request the Mercury playlist with <guid> <vodcrid> and <platform>
    Then I get a successful response

  Examples:
    | guid                                 | vodcrid | platform |
    | 7FA847EC-905C-41EA-BCF7-CC9E44A00CE3 | 323425  | DotCom   |
