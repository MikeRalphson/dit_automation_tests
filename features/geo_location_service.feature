
Feature: Geo reversegeolookup service 
  In order to geo-block content from outside the uk
  As a ITV
  I need

  Scenario Outline: The verify that the correct broadcaster value is returned
    Given I request the reversegeolookup service with the following <latitude> & <longitude>
    Then I should get the correct <broadcaster> returned from the postcode service
    
    Examples:
    | latitude 	| longitude | broadcaster | 
    | 51.523462 | -0.113742 | ITV 	  	  | 
    | 55.85803  | -4.29091  | STV 	  	  | 
    | 54.60398  | -5.92974  | UTV 	  	  | 
    | 51.483208 | -3.167304 | ITV 	   	  | 
    | 49.216856 | -2.117618 | Channel 	  | 
    
  @wip  
  Scenario Outline: The verify that the unknown broadcaster value is returned when i am outside the UK
    Given I request the reversegeolookup service with the following <latitude> & <longitude>
    Then I expected the see the findregion value from the postcode service
    
    Examples: 
    | latitude 	| longitude |     
    | 51.903613 | -8.503418 |