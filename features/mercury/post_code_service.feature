@sanity
@not_rc3
@not_local
@geo

Feature: PostCode service
  In order to geo-block content from outside the UK
  As ITV
  I want to set-up regionalisation via postcode

  Scenario Outline: Verify that the correct broadcaster value is returned
    Given I request the postcode service with the following <postcode>
    Then I should get the correct <broadcaster> returned
    And the response should contain the "Access-Control-Allow-Origin" header

  Examples:
    | postcode | broadcaster |
    | W6 9SW   | ITV         |
    | G51 1DA  | STV         |
    | BT15 1ED | UTV         |
    | CF24 0ED | ITV         |
    | JE2 3GF  | Channel     |

  Scenario Outline: Verify that the correct broadcaster value is returned for partial postcodes
    Given I request the postcode service with a partial <postcode>
    Then I should get the correct <broadcaster> returned
    And the response should contain the "Access-Control-Allow-Origin" header

  Examples:
    | postcode | broadcaster |
    | BB11     | ITV         |
    | NW10     | ITV         |
    | DG11     | ITV         |
    | DD11     | STV         |
    | IV13     | STV         |
    | KW15     | STV         |
    | BT11     | UTV         |
    | BT15     | UTV         |
    | JE23     | Channel     |
    | GY11     | Channel     |


  Scenario Outline: Verify that an error is thrown when a non-existent but correctly formatted postcode is used
    Given I request the postcode service with the following <postcode>
    Then I should get a not found error

  Examples:
    | postcode |
    | JK59 5GH |
    | BB11 9HG |


  Scenario Outline: Verify that an error is thrown when an incorrectly formatted postcode is used
    Given I request the postcode service with the following <postcode>
    Then I should get an invalid format error

  Examples:
    | postcode  |
    | cheese    |
    | jam butty |
