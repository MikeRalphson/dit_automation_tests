@sanity
@not_local
@not_rc3

Feature: Bloom Servoces are started
  In order to validate a back-end release
  As operations
  I want to be able to check that all services are up and after a deployment

  Scenario Outline: Verify basic bloom service are running
    Given a new backend release
	When you request the internal status api
	Then all the <services> should be <status> 
	
  Examples:
    | services                                             | status | 
	| Bloom Publication Service                            | 0      |
	| PublicContentStore                                   | 0      |
	| Bloom Distributor Service                            | 0      |
	| Bloom Core (DataStore, Security and Publication Log) | 0      |
	| Bloom Weather Service                                | 0      |
	| Bloom Football Service                               | 0      |
	| Sherpa (Whitelist Service)                           | 0      |
	
	
