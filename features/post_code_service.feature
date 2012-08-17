@wip

Feature: PostCode service 
  In order to geo-block content from outside the uk
  As a ITV
  I want to set-up regionalisation via postcode

  Scenario Outline: The verify that the correct broadcaster value is returned
    Given I request the postcode service with the following <postcode> 
    Then I should get the correct <broadcaster> returned
    
    | postcode  | broadcaster | 
    | W6 9SW 	| ITV 	  	  | #London
    | G51 1DA 	| STV 	  	  | #Scotland
    | BT15 1ED 	| UTV 	  	  | #N. Ireland
    | CF24 0ED 	| ITV 	   	  | #Wales
    | JE2 3GF 	| Channel 	  | #Channel Islands
    
    