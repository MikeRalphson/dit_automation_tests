
Feature: PostCode service 
  In order to geo-block content from outside the uk
  As a ITV
  I want to set-up regionalisation via postcode

  Scenario Outline: The verify that the correct broadcaster value is returned
    Given I request the postcode service with the following <postcode> 
    Then I should get the correct <broadcaster> returned
    
    Examples:
    | postcode  | broadcaster | 
    | W6 9SW 	| ITV 	  	  | 
    | G51 1DA 	| STV 	  	  | 
    | BT15 1ED 	| UTV 	  	  | 
    | CF24 0ED 	| ITV 	   	  | 
    | JE2 3GF 	| Channel 	  | 
    
    