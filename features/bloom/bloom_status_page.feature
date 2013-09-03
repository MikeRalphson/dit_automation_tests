@not_local
@not_ft02

Feature: Bloom Services are online
  In order to validate a back-end release
  As operations
  I want to be able to check that all services are up and running after a deployment

  Scenario: Verify basic Bloom services are alive
    Given a new back-end release
    When I request the Bloom internal status page
    Then every service should be alive

# Services:
# Bloom Publication Service
# PublicContentStore
# Bloom Distributor Service
# Bloom Core (DataStore, Security and Publication Log)
# Bloom Weather Service
# Sherpa (Whitelist Service)
