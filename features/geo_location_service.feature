@wip

Feature: Geo-Location service 
  In order to geo-block content from outside the uk
  As a ITV
  I need

  Scenario Outline: The verify that the correct broadcaster value is returned
    Given I request the geo-location service with the following <latitude> & <longitude>
    Then I should get the correct <broadcaster> returned
    
    | latitude 	| longitude | broadcaster | 
    | 51.523462 | -0.113742 | ITV 	  	  | #London
    | 55.85803  | -4.29091  | STV 	  	  | #Scotland
    | 54.60398  | -5.92974  | UTV 	  	  | #N. Ireland
    | 51.483208 | -3.167304 | ITV 	   	  | #Wales
    | 49.216856 | -2.117618 | Channel 	  | #Channel Islands
    | 51.903613 | -8.503418 | Unknown 	  | #French
    
    