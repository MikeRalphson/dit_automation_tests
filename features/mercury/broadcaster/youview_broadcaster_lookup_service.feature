@live
Feature: YouView Broadcaster lookup service
  In order to map a YouView region to an ITV Broadcaster
  As a YouView client
  I want to be able to use a lookup service to do the mapping

  Scenario Outline: Lookup Broadcaster for valid YouView regions
    When I make a YouView Broadcaster Lookup request for <region>
    Then the response should contain the correct <broadcaster>

  Examples:
    | region                          | broadcaster |
    | GBR-ENG-borders                 | Itv         |
    | GBR-ENG-north_yorks_tees        | Itv         |
    | GBR-ENG-north_east              | Itv         |
    | GBR-ENG-east_yorks_lincs        | Itv         |
    | GBR-ENG-south_yorks             | Itv         |
    | GBR-ENG-yorkshire               | Itv         |
    | GBR-ENG-south_lakes             | Itv         |
    | GBR-ENG-north_west              | Itv         |
    | GBR-ENG-north_yorks_tees        | Itv         |
    | GBR-ENG-east_midlands           | Itv         |
    | GBR-ENG-gloucestershire         | Itv         |
    | GBR-ENG-gloucestershire-central | Itv         |
    | GBR-ENG-gloucestershire-west    | Itv         |
    | GBR-ENG-west_midlands           | Itv         |
    | GBR-ENG-oxon_bucks              | Itv         |
    | GBR-ENG-berks_north_hants       | Itv         |
    | GBR-ENG-east_sussex             | Itv         |
    | GBR-ENG-south                   | Itv         |
    | GBR-ENG-east_anglia             | Itv         |
    | GBR-ENG-cambs_beds              | Itv         |
    | GBR-ENG-london                  | Itv         |
    | GBR-ENG-thames_estuary          | Itv         |
    | GBR-ENG-west                    | Itv         |
    | GBR-ENG-south_west              | Itv         |
    | GBR-ENG-south_east              | Itv         |
    | GBR-ENG-kent                    | Itv         |
    | GBR-SCT-west_borders            | Itv         |
    | GBR-SCT-east_borders            | Itv         |
    | GBR-WLS                         | Itv         |
    | GBR-CHA                         | Itv         |
    | GBR-IOM                         | Itv         |
    | GBR-SCT-north                   | Stv         |
    | GBR-SCT-north                   | Stv         |
    | GBR-SCT-north                   | Stv         |
    | GBR-SCT-north                   | Stv         |
    | GBR-SCT-central                 | Stv         |
    | GBR-NIR                         | Utv         |
    | IRL                             | Utv         |

  Scenario Outline: Lookup Broadcaster for invalid YouView regions
    When I make a YouView Broadcaster Lookup request for <region>
    Then the correct <error> is returned

  Examples:
    | region        | error    |
    | GBR-ENG       | NotFound |
    | GBR-SCT       | NotFound |
    | gbr-sct       | NotFound |
    | unknownregion | NotFound |
    | Hello         | NotFound |
    | $foo          | NotFound |
    | e-2           | NotFound |
    | 123456789     | NotFound |
    |               | Invalid  |
