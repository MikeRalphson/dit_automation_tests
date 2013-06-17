@live
Feature: Broadcaster API feeds
  In order to validate the correct broadcasts
  As a backend enabler
  I must ensure the appropriate broadcasts are transmitted per region

  Scenario Outline: DN-221 Verify that the correct urls are available for a certain broadcaster for Android
    Given I request the master feed for <platform> and <broadcaster>
    Then the master feed should contain the expected <links> for the requested broadcaster

  Examples:
    | broadcaster | platform | links                     |
    | itv         | android  | Episode/Crucial           |
    | itv         | android  | Episode/MostWatched       |
    | itv         | android  | Programme/PerChannel/itv1 |
    | itv         | android  | Programme/PerChannel/itv2 |
    | itv         | android  | Programme/PerChannel/itv3 |
    | itv         | android  | Programme/PerChannel/itv4 |
    | itv         | android  | Programme/PerChannel/citv |
    | itv         | android  | Programme/Search          |
    | itv         | android  | Programme/SearchAtoZ      |
    | channel     | android  | Episode/Crucial           |
    | channel     | android  | Episode/MostWatched       |
    | channel     | android  | Programme/PerChannel/itv1 |
    | channel     | android  | Programme/PerChannel/itv2 |
    | channel     | android  | Programme/PerChannel/itv3 |
    | channel     | android  | Programme/PerChannel/itv4 |
    | channel     | android  | Programme/PerChannel/citv |
    | channel     | android  | Programme/Search          |
    | channel     | android  | Programme/SearchAtoZ      |

  Scenario Outline: DN-221 Verify that the correct urls are available for a certain broadcaster for Android
    Given I request the master feed for <platform> and <broadcaster>
    Then the master feed should contain the expected <links> for the requested broadcaster

  Examples:
    | broadcaster | platform | links                     |
    | stv         | android  | Episode/Crucial           |
    | stv         | android  | Episode/MostWatched       |
    | stv         | android  | Programme/PerChannel/itv2 |
    | stv         | android  | Programme/PerChannel/itv3 |
    | stv         | android  | Programme/PerChannel/itv4 |
    | stv         | android  | Programme/PerChannel/citv |
    | stv         | android  | Programme/Search          |
    | stv         | android  | Programme/SearchAtoZ      |
    | utv         | android  | Episode/Crucial           |
    | utv         | android  | Episode/MostWatched       |
    | utv         | android  | Programme/PerChannel/itv2 |
    | utv         | android  | Programme/PerChannel/itv3 |
    | utv         | android  | Programme/PerChannel/itv4 |
    | utv         | android  | Programme/PerChannel/citv |
    | utv         | android  | Programme/Search          |
    | utv         | android  | Programme/SearchAtoZ      |


  Scenario Outline: Verify that the correct urls are available for a certain broadcaster for Mobile
    Given I request the master feed for <broadcaster> and <platform> with <screen size>
    Then the master feed should contain the expected <links> for the requested broadcaster

  Examples:
    | broadcaster | platform | screen size | links                     |
    | itv         | mobile   | small       | Episode/Crucial           |
    | itv         | mobile   | small       | Episode/MostWatched       |
    | itv         | mobile   | small       | Programme/PerChannel/itv1 |
    | itv         | mobile   | small       | Programme/PerChannel/itv2 |
    | itv         | mobile   | small       | Programme/PerChannel/itv3 |
    | itv         | mobile   | small       | Programme/PerChannel/itv4 |
    | itv         | mobile   | small       | Programme/PerChannel/citv |
    | itv         | mobile   | small       | Programme/Search          |
    | itv         | mobile   | small       | Programme/SearchAtoZ      |
    | stv         | mobile   | small       | Episode/Crucial           |
    | stv         | mobile   | small       | Episode/MostWatched       |
    | stv         | mobile   | small       | Programme/PerChannel/itv2 |
    | stv         | mobile   | small       | Programme/PerChannel/itv3 |
    | stv         | mobile   | small       | Programme/PerChannel/itv4 |
    | stv         | mobile   | small       | Programme/PerChannel/citv |
    | stv         | mobile   | small       | Programme/Search          |
    | stv         | mobile   | small       | Programme/SearchAtoZ      |
    | utv         | mobile   | small       | Episode/Crucial           |
    | utv         | mobile   | small       | Episode/MostWatched       |
    | utv         | mobile   | small       | Programme/PerChannel/itv2 |
    | utv         | mobile   | small       | Programme/PerChannel/itv3 |
    | utv         | mobile   | small       | Programme/PerChannel/itv4 |
    | utv         | mobile   | small       | Programme/PerChannel/citv |
    | utv         | mobile   | small       | Programme/Search          |
    | utv         | mobile   | small       | Programme/SearchAtoZ      |
    | channel     | mobile   | small       | Episode/Crucial           |
    | channel     | mobile   | small       | Episode/MostWatched       |
    | channel     | mobile   | small       | Programme/PerChannel/itv2 |
    | channel     | mobile   | small       | Programme/PerChannel/itv3 |
    | channel     | mobile   | small       | Programme/PerChannel/itv4 |
    | channel     | mobile   | small       | Programme/PerChannel/citv |
    | channel     | mobile   | small       | Programme/Search          |
    | channel     | mobile   | small       | Programme/SearchAtoZ      |
    | itv         | mobile   | big         | Episode/Crucial           |
    | itv         | mobile   | big         | Episode/MostWatched       |
    | itv         | mobile   | big         | Programme/PerChannel/itv1 |
    | itv         | mobile   | big         | Programme/PerChannel/itv2 |
    | itv         | mobile   | big         | Programme/PerChannel/itv3 |
    | itv         | mobile   | big         | Programme/PerChannel/itv4 |
    | itv         | mobile   | big         | Programme/PerChannel/citv |
    | itv         | mobile   | big         | Programme/Search          |
    | itv         | mobile   | big         | Programme/SearchAtoZ      |
    | stv         | mobile   | big         | Episode/Crucial           |
    | stv         | mobile   | big         | Episode/MostWatched       |
    | stv         | mobile   | big         | Programme/PerChannel/itv2 |
    | stv         | mobile   | big         | Programme/PerChannel/itv3 |
    | stv         | mobile   | big         | Programme/PerChannel/itv4 |
    | stv         | mobile   | big         | Programme/PerChannel/citv |
    | stv         | mobile   | big         | Programme/Search          |
    | stv         | mobile   | big         | Programme/SearchAtoZ      |
    | utv         | mobile   | big         | Episode/Crucial           |
    | utv         | mobile   | big         | Episode/MostWatched       |
    | utv         | mobile   | big         | Programme/PerChannel/itv2 |
    | utv         | mobile   | big         | Programme/PerChannel/itv3 |
    | utv         | mobile   | big         | Programme/PerChannel/itv4 |
    | utv         | mobile   | big         | Programme/PerChannel/citv |
    | utv         | mobile   | big         | Programme/Search          |
    | utv         | mobile   | big         | Programme/SearchAtoZ      |
    | channel     | mobile   | big         | Episode/Crucial           |
    | channel     | mobile   | big         | Episode/MostWatched       |
    | channel     | mobile   | big         | Programme/PerChannel/itv2 |
    | channel     | mobile   | big         | Programme/PerChannel/itv3 |
    | channel     | mobile   | big         | Programme/PerChannel/itv4 |
    | channel     | mobile   | big         | Programme/PerChannel/citv |
    | channel     | mobile   | big         | Programme/Search          |
    | channel     | mobile   | big         | Programme/SearchAtoZ      |

  Scenario Outline: Verify that the correct urls are available for a certain broadcaster for Samsung
    Given I request the master feed for <platform> and <broadcaster>
    Then the master feed should contain the expected <links> for the requested broadcaster

  Examples:
    | broadcaster | platform | links                     |
    | itv         | samsung  | Episode/Crucial           |
    | itv         | samsung  | Episode/MostWatched       |
    | itv         | samsung  | Programme/PerChannel/itv1 |
    | itv         | samsung  | Programme/PerChannel/itv2 |
    | itv         | samsung  | Programme/PerChannel/itv3 |
    | itv         | samsung  | Programme/PerChannel/itv4 |
    | itv         | samsung  | Programme/PerChannel/citv |
    | itv         | samsung  | AToZ                      |
    | stv         | samsung  | Episode/Crucial           |
    | stv         | samsung  | Episode/MostWatched       |
    | stv         | samsung  | Programme/PerChannel/itv1 |
    | stv         | samsung  | Programme/PerChannel/itv2 |
    | stv         | samsung  | Programme/PerChannel/itv3 |
    | stv         | samsung  | Programme/PerChannel/itv4 |
    | stv         | samsung  | Programme/PerChannel/citv |
    | stv         | samsung  | AToZ                      |
    | utv         | samsung  | Episode/Crucial           |
    | utv         | samsung  | Episode/MostWatched       |
    | utv         | samsung  | Programme/PerChannel/itv1 |
    | utv         | samsung  | Programme/PerChannel/itv2 |
    | utv         | samsung  | Programme/PerChannel/itv3 |
    | utv         | samsung  | Programme/PerChannel/itv4 |
    | utv         | samsung  | Programme/PerChannel/citv |
    | utv         | samsung  | AToZ                      |
    | channel     | samsung  | Episode/Crucial           |
    | channel     | samsung  | Episode/MostWatched       |
    | channel     | samsung  | Programme/PerChannel/itv1 |
    | channel     | samsung  | Programme/PerChannel/itv2 |
    | channel     | samsung  | Programme/PerChannel/itv3 |
    | channel     | samsung  | Programme/PerChannel/itv4 |
    | channel     | samsung  | Programme/PerChannel/citv |
    | channel     | samsung  | AToZ                      |

  Scenario Outline: Verify that the correct urls are available for a certain broadcaster for YouView
    Given I request the master feed for <platform> and <broadcaster>
    Then the master feed should contain the expected <links> for the requested broadcaster

  Examples:
    | broadcaster | platform | links                     |
    | itv         | youview  | Episode/Crucial           |
    | itv         | youview  | Episode/MostWatched       |
    | itv         | youview  | Programme/PerChannel/itv1 |
    | itv         | youview  | Programme/PerChannel/itv2 |
    | itv         | youview  | Programme/PerChannel/itv3 |
    | itv         | youview  | Programme/PerChannel/itv4 |
    | itv         | youview  | Programme/PerChannel/citv |
    | itv         | youview  | AToZ                      |
    | stv         | youview  | Episode/Crucial           |
    | stv         | youview  | Episode/MostWatched       |
    | stv         | youview  | Programme/PerChannel/itv1 |
    | stv         | youview  | Programme/PerChannel/itv2 |
    | stv         | youview  | Programme/PerChannel/itv3 |
    | stv         | youview  | Programme/PerChannel/itv4 |
    | stv         | youview  | Programme/PerChannel/citv |
    | stv         | youview  | AToZ                      |
    | utv         | youview  | Episode/Crucial           |
    | utv         | youview  | Episode/MostWatched       |
    | utv         | youview  | Programme/PerChannel/itv1 |
    | utv         | youview  | Programme/PerChannel/itv2 |
    | utv         | youview  | Programme/PerChannel/itv3 |
    | utv         | youview  | Programme/PerChannel/itv4 |
    | utv         | youview  | Programme/PerChannel/citv |
    | utv         | youview  | AToZ                      |
    | channel     | youview  | Episode/Crucial           |
    | channel     | youview  | Episode/MostWatched       |
    | channel     | youview  | Programme/PerChannel/itv1 |
    | channel     | youview  | Programme/PerChannel/itv2 |
    | channel     | youview  | Programme/PerChannel/itv3 |
    | channel     | youview  | Programme/PerChannel/itv4 |
    | channel     | youview  | Programme/PerChannel/citv |
    | channel     | youview  | AToZ                      |

  @wip
  Scenario: Verify that masterfeed for Samsung & Youview returns all feed links in the xml
    Given I request the master feed for <platform> and <broadcaster>
    Then the master feed should contain the itv1 link with the feed
