@live
Feature: Alcatraz Cross Domain XML
  So that ITV web applications can communicate,
  As Alcatraz,
  I want to provide a cross domain XML file for the ITV domain

  Scenario: Cross domain XML validation
    Given I request the cross domain XML from Alcatraz
    Then it should allow access across all sites on the ITV domain
