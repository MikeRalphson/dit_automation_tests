@sanity
@not_local
@not_rc3
@geo

Feature: Geo reversegeolookup service
  In order to geo-block content from outside the UK
  As a Mobile Application
  I want to be able to query a reverselookup service to restrict ITV1 content to the correct broadcasters

  Scenario Outline: To verify that the correct broadcaster value is returned
    Given I request the reversegeolookup service with the following <latitude> & <longitude>
    Then I should get the correct <broadcaster> returned from the postcode service
    And the response should contain the "Access-Control-Allow-Origin" header

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

  Scenario Outline: To verify that the correct postcode is returned
    Given I request the geolookup for postcode service with the following <latitude> & <longitude>
    Then I should not get a 302 redirect to the postcode service
    And I should get the correct <postcode> returned from the geolookup postcode service
    And the response should contain the "Access-Control-Allow-Origin" header

    Examples:
      | latitude  | longitude | postcode |
      | 51.523462 | -0.113742 | W69SW    |
      | 51.412816 | -0.087774 | SE193LX  |
      | 55.85803  | -4.29091  | G511DA   |
      | 54.60398  | -5.92974  | BT151ED  |
      | 51.483208 | -3.167304 | CF240ED  |
      | 49.216856 | -2.117618 | JE23GF   |

