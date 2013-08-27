@live
@flakey
@not_local
Feature: Reverse Geo Lookup service
  In order to geo-block content from outside the UK
  As a Mobile Application
  I want to be able to query a reverselookup service to restrict ITV1 content to the correct broadcasters

  Scenario Outline: The correct broadcaster value is returned for UK locations
    Given I request the reversegeolookup service with <latitude> & <longitude>
    Then I should receive the correct <broadcaster> from the postcode service
    And the response should contain the "Access-Control-Allow-Origin" header

  Examples:
    | latitude  | longitude | broadcaster |
    | 51.523462 | -0.113742 | ITV         |
    | 55.85803  | -4.29091  | STV         |
    | 54.60398  | -5.92974  | UTV         |
    | 51.483208 | -3.167304 | ITV         |
    | 49.216856 | -2.117618 | ITV         |

  Scenario Outline: A 'not found' value is returned for locations outside the UK
    Given I request the reversegeolookup service with <latitude> & <longitude>
    Then I should not receive a 302 redirect to the postcode service
    Then I should receive a not found error

  Examples:
    | latitude  | longitude |
    | 51.903613 | -8.503418 |

  Scenario Outline: To verify that the correct postcode is returned
    Given I request the geolookup for postcode service with the following <latitude> & <longitude>
    Then I should not receive a 302 redirect to the postcode service
    And I should receive the correct <postcode> from the geolookup postcode service
    And the response should contain the "Access-Control-Allow-Origin" header

  Examples:
    | latitude  | longitude | postcode |
    | 51.544211 | -0.227743 | NW102RN  |
    | 51.507732 | -0.111514 | SE19     |
    | 52.501584 | 1.117733  | NR161    |
    | 53.776817 | -2.255116 | BB114HD  |
