@sanity
@not_local

Feature: Geo reversegeolookup service
  In order to geo-block content from outside the UK
  As a Mobile Application
  I want to be able to query a reverselookup service to restrict ITV1 content to the correct broadcasters

  Scenario Outline: To verify that the correct broadcaster value is returned
    Given I request the reversegeolookup service with the following <latitude> & <longitude>
    Then I should get the correct <broadcaster> returned from the postcode service

  Examples:
    | latitude  | longitude | broadcaster |
    | 51.523462 | -0.113742 | ITV         |
    | 55.85803  | -4.29091  | STV         |
    | 54.60398  | -5.92974  | UTV         |
    | 51.483208 | -3.167304 | ITV         |
    | 49.216856 | -2.117618 | Channel     |

  Scenario Outline: To verify that the unknown broadcaster value is returned when I am outside the UK
    Given I request the reversegeolookup service from outside the UK with <latitude> & <longitude>
    Then I expect to see a 500 Internal Server Error

  Examples:
    | latitude  | longitude |
    | 51.903613 | -8.503418 |
