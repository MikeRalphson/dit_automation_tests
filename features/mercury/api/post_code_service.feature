@live
@geo
@not_local
Feature: Postcode service
  In order to geo-block content from outside the UK
  As ITV
  I want to set-up regionalisation via postcode

  Scenario Outline: Verify that the correct broadcaster value is returned
    Given I request the postcode service with <postcode>
    Then I should receive the correct <broadcaster>
    And the response should contain the "Access-Control-Allow-Origin" header

  Examples:
    | postcode | broadcaster |
    | W6 9SW   | ITV         |
    | G51 1DA  | STV         |
    | BT15 1ED | UTV         |
    | CF24 0ED | ITV         |
    | JE2 3GF  | ITV         |

  Scenario Outline: Verify that the correct broadcaster value is returned for partial postcodes
    Given I request the postcode service using a partial <postcode>
    Then I should receive the correct <broadcaster>
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
    | JE23     | ITV         |
    | GY11     | ITV         |

  Scenario Outline: Verify that an error is thrown when a non-existent but correctly formatted postcode is used
    Given I request the postcode service with <postcode>
    Then I should receive a not found error

  Examples:
    | postcode |
    | JK59 5GH |
    | BB11 9HG |

  Scenario Outline: Verify that an error is thrown when an incorrectly formatted postcode is used
    Given I request the postcode service with <postcode>
    Then I should get an invalid format error

  Examples:
    | postcode  |
    | cheese    |
    | jam butty |
