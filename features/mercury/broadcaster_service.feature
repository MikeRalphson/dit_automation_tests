@sanity
@broadcaster

Feature: Broadcaster API feeds
  In order to validate the correct broadcasts
  As a backend enabler
  I must ensure the appropriate broadcasts are transmitted per region

  Scenario Outline: Verify correct broadcaster service for Mobile
    Given I request the content for <broadcaster> and <platform> with <screen size>
    Then the response should contain channel <content>

    Examples:
      | broadcaster | platform | screen size | content           |
      | itv         | mobile   | small       | CRUCIAL CATCHUP   |
      | itv         | mobile   | small       | ITV1              |
      | itv         | mobile   | small       | ITV2              |
      | itv         | mobile   | small       | ITV3              |
      | itv         | mobile   | small       | ITV4              |
      | itv         | mobile   | small       | CITV              |
      | itv         | mobile   | small       | PROGRAMMES BY DAY |
      | itv         | mobile   | small       | MOST WATCHED      |
      | itv         | mobile   | small       | SEARCH            |
      | itv         | mobile   | small       | PROGRAMME INFO    |
      | itv         | mobile   | small       | EPISODE INFO      |
      | itv         | mobile   | small       | A - Z             |
      | utv         | mobile   | small       | CRUCIAL CATCHUP   |
      | utv         | mobile   | small       | ITV2              |
      | utv         | mobile   | small       | ITV3              |
      | utv         | mobile   | small       | ITV4              |
      | utv         | mobile   | small       | CITV              |
      | utv         | mobile   | small       | PROGRAMMES BY DAY |
      | utv         | mobile   | small       | MOST WATCHED      |
      | utv         | mobile   | small       | SEARCH            |
      | utv         | mobile   | small       | PROGRAMME INFO    |
      | utv         | mobile   | small       | EPISODE INFO      |
      | utv         | mobile   | small       | A - Z             |
      | stv         | mobile   | small       | CRUCIAL CATCHUP   |
      | stv         | mobile   | small       | ITV2              |
      | stv         | mobile   | small       | ITV3              |
      | stv         | mobile   | small       | ITV4              |
      | stv         | mobile   | small       | CITV              |
      | stv         | mobile   | small       | PROGRAMMES BY DAY |
      | stv         | mobile   | small       | MOST WATCHED      |
      | stv         | mobile   | small       | SEARCH            |
      | stv         | mobile   | small       | PROGRAMME INFO    |
      | stv         | mobile   | small       | EPISODE INFO      |
      | stv         | mobile   | small       | A - Z             |
      | channel     | mobile   | small       | CRUCIAL CATCHUP   |
      | channel     | mobile   | small       | ITV2              |
      | channel     | mobile   | small       | ITV3              |
      | channel     | mobile   | small       | ITV4              |
      | channel     | mobile   | small       | CITV              |
      | channel     | mobile   | small       | PROGRAMMES BY DAY |
      | channel     | mobile   | small       | MOST WATCHED      |
      | channel     | mobile   | small       | SEARCH            |
      | channel     | mobile   | small       | PROGRAMME INFO    |
      | channel     | mobile   | small       | EPISODE INFO      |
      | channel     | mobile   | small       | A - Z             |
      | unknown     | mobile   | small       | CRUCIAL CATCHUP   |
      | unknown     | mobile   | small       | ITV2              |
      | unknown     | mobile   | small       | ITV3              |
      | unknown     | mobile   | small       | ITV4              |
      | unknown     | mobile   | small       | CITV              |
      | unknown     | mobile   | small       | PROGRAMMES BY DAY |
      | unknown     | mobile   | small       | MOST WATCHED      |
      | unknown     | mobile   | small       | SEARCH            |
      | unknown     | mobile   | small       | PROGRAMME INFO    |
      | unknown     | mobile   | small       | EPISODE INFO      |
      | unknown     | mobile   | small       | A - Z             |
      | itv         | mobile   | big         | CRUCIAL CATCHUP   |
      | itv         | mobile   | big         | ITV1              |
      | itv         | mobile   | big         | ITV2              |
      | itv         | mobile   | big         | ITV3              |
      | itv         | mobile   | big         | ITV4              |
      | itv         | mobile   | big         | CITV              |
      | itv         | mobile   | big         | PROGRAMMES BY DAY |
      | itv         | mobile   | big         | MOST WATCHED      |
      | itv         | mobile   | big         | SEARCH            |
      | itv         | mobile   | big         | PROGRAMME INFO    |
      | itv         | mobile   | big         | EPISODE INFO      |
      | itv         | mobile   | big         | A - Z             |
      | utv         | mobile   | big         | CRUCIAL CATCHUP   |
      | utv         | mobile   | big         | ITV2              |
      | utv         | mobile   | big         | ITV3              |
      | utv         | mobile   | big         | ITV4              |
      | utv         | mobile   | big         | CITV              |
      | utv         | mobile   | big         | PROGRAMMES BY DAY |
      | utv         | mobile   | big         | MOST WATCHED      |
      | utv         | mobile   | big         | SEARCH            |
      | utv         | mobile   | big         | PROGRAMME INFO    |
      | utv         | mobile   | big         | EPISODE INFO      |
      | utv         | mobile   | big         | A - Z             |
      | stv         | mobile   | big         | CRUCIAL CATCHUP   |
      | stv         | mobile   | big         | ITV2              |
      | stv         | mobile   | big         | ITV3              |
      | stv         | mobile   | big         | ITV4              |
      | stv         | mobile   | big         | CITV              |
      | stv         | mobile   | big         | PROGRAMMES BY DAY |
      | stv         | mobile   | big         | MOST WATCHED      |
      | stv         | mobile   | big         | SEARCH            |
      | stv         | mobile   | big         | PROGRAMME INFO    |
      | stv         | mobile   | big         | EPISODE INFO      |
      | stv         | mobile   | big         | A - Z             |
      | channel     | mobile   | big         | CRUCIAL CATCHUP   |
      | channel     | mobile   | big         | ITV2              |
      | channel     | mobile   | big         | ITV3              |
      | channel     | mobile   | big         | ITV4              |
      | channel     | mobile   | big         | CITV              |
      | channel     | mobile   | big         | PROGRAMMES BY DAY |
      | channel     | mobile   | big         | MOST WATCHED      |
      | channel     | mobile   | big         | SEARCH            |
      | channel     | mobile   | big         | PROGRAMME INFO    |
      | channel     | mobile   | big         | EPISODE INFO      |
      | channel     | mobile   | big         | A - Z             |
      | unknown     | mobile   | big         | CRUCIAL CATCHUP   |
      | unknown     | mobile   | big         | ITV2              |
      | unknown     | mobile   | big         | ITV3              |
      | unknown     | mobile   | big         | ITV4              |
      | unknown     | mobile   | big         | CITV              |
      | unknown     | mobile   | big         | PROGRAMMES BY DAY |
      | unknown     | mobile   | big         | MOST WATCHED      |
      | unknown     | mobile   | big         | SEARCH            |
      | unknown     | mobile   | big         | PROGRAMME INFO    |
      | unknown     | mobile   | big         | EPISODE INFO      |
      | unknown     | mobile   | big         | A - Z             |


  Scenario Outline: Verify correct broadcaster service for YouView
    Given I request the content for <broadcaster> and <platform>
    Then the response should contain channel <content>

    Examples:
      | broadcaster | platform | content      |
      | itv         | youview  | ITV1         |
      | itv         | youview  | ITV2         |
      | itv         | youview  | ITV3         |
      | itv         | youview  | ITV4         |
      | itv         | youview  | CITV         |
      | itv         | youview  | A - Z        |
      | itv         | youview  | Most Popular |
      | itv         | youview  | Don't Miss   |
      | itv         | youview  | By Day       |
      | itv         | youview  | Last Watched |
      | utv         | youview  | ITV1         |
      | utv         | youview  | ITV2         |
      | utv         | youview  | ITV3         |
      | utv         | youview  | ITV4         |
      | utv         | youview  | CITV         |
      | utv         | youview  | A - Z        |
      | utv         | youview  | Most Popular |
      | utv         | youview  | Don't Miss   |
      | utv         | youview  | By Day       |
      | utv         | youview  | Last Watched |
      | stv         | youview  | ITV1         |
      | stv         | youview  | ITV2         |
      | stv         | youview  | ITV3         |
      | stv         | youview  | ITV4         |
      | stv         | youview  | CITV         |
      | stv         | youview  | A - Z        |
      | stv         | youview  | Most Popular |
      | stv         | youview  | Don't Miss   |
      | stv         | youview  | By Day       |
      | stv         | youview  | Last Watched |
      | channel     | youview  | ITV1         |
      | channel     | youview  | ITV2         |
      | channel     | youview  | ITV3         |
      | channel     | youview  | ITV4         |
      | channel     | youview  | CITV         |
      | channel     | youview  | A - Z        |
      | channel     | youview  | Most Popular |
      | channel     | youview  | Don't Miss   |
      | channel     | youview  | By Day       |
      | channel     | youview  | Last Watched |
      | unknown     | youview  | ITV1         |
      | unknown     | youview  | ITV2         |
      | unknown     | youview  | ITV3         |
      | unknown     | youview  | ITV4         |
      | unknown     | youview  | CITV         |
      | unknown     | youview  | A - Z        |
      | unknown     | youview  | Most Popular |
      | unknown     | youview  | Don't Miss   |
      | unknown     | youview  | By Day       |
      | unknown     | youview  | Last Watched |


  Scenario Outline: Verify correct broadcaster service for Samsung
    Given I request the content for <broadcaster> and <platform>
    Then the response should contain channel <content>

    Examples:
      | broadcaster | platform | content      |
      | itv         | samsung  | ITV1         |
      | itv         | samsung  | ITV2         |
      | itv         | samsung  | ITV3         |
      | itv         | samsung  | ITV4         |
      | itv         | samsung  | CITV         |
      | itv         | samsung  | A - Z        |
      | itv         | samsung  | Most Popular |
      | itv         | samsung  | Don't Miss   |
      | itv         | samsung  | By Day       |
      | itv         | samsung  | Last Watched |
      | utv         | samsung  | ITV1         |
      | utv         | samsung  | ITV2         |
      | utv         | samsung  | ITV3         |
      | utv         | samsung  | ITV4         |
      | utv         | samsung  | CITV         |
      | utv         | samsung  | A - Z        |
      | utv         | samsung  | Most Popular |
      | utv         | samsung  | Don't Miss   |
      | utv         | samsung  | By Day       |
      | utv         | samsung  | Last Watched |
      | stv         | samsung  | ITV1         |
      | stv         | samsung  | ITV2         |
      | stv         | samsung  | ITV3         |
      | stv         | samsung  | ITV4         |
      | stv         | samsung  | CITV         |
      | stv         | samsung  | A - Z        |
      | stv         | samsung  | Most Popular |
      | stv         | samsung  | Don't Miss   |
      | stv         | samsung  | By Day       |
      | stv         | samsung  | Last Watched |
      | channel     | samsung  | ITV1         |
      | channel     | samsung  | ITV2         |
      | channel     | samsung  | ITV3         |
      | channel     | samsung  | ITV4         |
      | channel     | samsung  | CITV         |
      | channel     | samsung  | A - Z        |
      | channel     | samsung  | Most Popular |
      | channel     | samsung  | Don't Miss   |
      | channel     | samsung  | By Day       |
      | channel     | samsung  | Last Watched |
      | unknown     | samsung  | ITV1         |
      | unknown     | samsung  | ITV2         |
      | unknown     | samsung  | ITV3         |
      | unknown     | samsung  | ITV4         |
      | unknown     | samsung  | CITV         |
      | unknown     | samsung  | A - Z        |
      | unknown     | samsung  | Most Popular |
      | unknown     | samsung  | Don't Miss   |
      | unknown     | samsung  | By Day       |
      | unknown     | samsung  | Last Watched |

  Scenario Outline: Verify correct broadcaster service for Android
    Given I request the content for <broadcaster> and <platform>
    Then the response should contain channel <content>

    Examples:
      | broadcaster | platform | content           |
      | itv         | android  | CRUCIAL CATCHUP   |
      | itv         | android  | ITV1              |
      | itv         | android  | ITV2              |
      | itv         | android  | ITV3              |
      | itv         | android  | ITV4              |
      | itv         | android  | CITV              |
      | itv         | android  | PROGRAMMES BY DAY |
      | itv         | android  | MOST WATCHED      |
      | itv         | android  | SEARCH            |
      | itv         | android  | PROGRAMME INFO    |
      | itv         | android  | EPISODE INFO      |
      | itv         | android  | A - Z             |
      | utv         | android  | CRUCIAL CATCHUP   |
      | utv         | android  | ITV2              |
      | utv         | android  | ITV3              |
      | utv         | android  | ITV4              |
      | utv         | android  | CITV              |
      | utv         | android  | PROGRAMMES BY DAY |
      | utv         | android  | MOST WATCHED      |
      | utv         | android  | SEARCH            |
      | utv         | android  | PROGRAMME INFO    |
      | utv         | android  | EPISODE INFO      |
      | utv         | android  | A - Z             |
      | stv         | android  | CRUCIAL CATCHUP   |
      | stv         | android  | ITV2              |
      | stv         | android  | ITV3              |
      | stv         | android  | ITV4              |
      | stv         | android  | CITV              |
      | stv         | android  | PROGRAMMES BY DAY |
      | stv         | android  | MOST WATCHED      |
      | stv         | android  | SEARCH            |
      | stv         | android  | PROGRAMME INFO    |
      | stv         | android  | EPISODE INFO      |
      | stv         | android  | A - Z             |
      | channel     | android  | CRUCIAL CATCHUP   |
      | channel     | android  | ITV1              |
      | channel     | android  | ITV2              |
      | channel     | android  | ITV3              |
      | channel     | android  | ITV4              |
      | channel     | android  | CITV              |
      | channel     | android  | PROGRAMMES BY DAY |
      | channel     | android  | MOST WATCHED      |
      | channel     | android  | SEARCH            |
      | channel     | android  | PROGRAMME INFO    |
      | channel     | android  | EPISODE INFO      |
      | channel     | android  | A - Z             |
      | unknown     | android  | CRUCIAL CATCHUP   |
      | unknown     | android  | ITV2              |
      | unknown     | android  | ITV3              |
      | unknown     | android  | ITV4              |
      | unknown     | android  | CITV              |
      | unknown     | android  | PROGRAMMES BY DAY |
      | unknown     | android  | MOST WATCHED      |
      | unknown     | android  | SEARCH            |
      | unknown     | android  | PROGRAMME INFO    |
      | unknown     | android  | EPISODE INFO      |
      | unknown     | android  | A - Z             |

  Scenario Outline: Verify ITV1 is not available for STV or UTV for Mobile
    Given I request the content for <broadcaster> and <platform> with <screen size>
    Then the response should not contain <content>

    Examples:
      | broadcaster | platform | screen size | content |
      | utv         | mobile   | small       | ITV1    |
      | stv         | mobile   | small       | ITV1    |
      | channel     | mobile   | small       | ITV1    |
      | unknown     | mobile   | small       | ITV1    |

  Scenario Outline: Verify that masterfeed for Samsung & Youview returns all feed links in the xml
    Given I request the masterfeed for <broadcaster> and <platform>
    Then the masterfeed should contain the itv1 link with the feed

  Scenario Outline: Verify ITV1 is not available for STV or UTV for Android
    Given I request the content for <broadcaster> and <platform>
    Then the response should not contain <content>

    Examples:
      | broadcaster | platform | content |
      | utv         | android  | ITV1    |
      | stv         | android  | ITV1    |
      | unknown     | android  | ITV1    |

  Scenario Outline: Verify broadcast service for Android ignores screen size if provided
    Given I request the content for <broadcaster> and <platform> with <screen size>
    Then the response should contain channel <content>

    Examples:
      | broadcaster | platform | screen size | content           |
      | itv         | android  | small       | CRUCIAL CATCHUP   |
      | itv         | android  | small       | ITV1              |
      | itv         | android  | small       | ITV2              |
      | itv         | android  | small       | ITV3              |
      | itv         | android  | small       | ITV4              |
      | itv         | android  | small       | CITV              |
      | itv         | android  | small       | PROGRAMMES BY DAY |
      | itv         | android  | small       | MOST WATCHED      |
      | itv         | android  | small       | SEARCH            |
      | itv         | android  | small       | PROGRAMME INFO    |
      | itv         | android  | small       | EPISODE INFO      |
      | itv         | android  | small       | A - Z             |
      | utv         | android  | small       | CRUCIAL CATCHUP   |
      | utv         | android  | small       | ITV2              |
      | utv         | android  | small       | ITV3              |
      | utv         | android  | small       | ITV4              |
      | utv         | android  | small       | CITV              |
      | utv         | android  | small       | PROGRAMMES BY DAY |
      | utv         | android  | small       | MOST WATCHED      |
      | utv         | android  | small       | SEARCH            |
      | utv         | android  | small       | PROGRAMME INFO    |
      | utv         | android  | small       | EPISODE INFO      |
      | utv         | android  | small       | A - Z             |
      | stv         | android  | small       | CRUCIAL CATCHUP   |
      | stv         | android  | small       | ITV2              |
      | stv         | android  | small       | ITV3              |
      | stv         | android  | small       | ITV4              |
      | stv         | android  | small       | CITV              |
      | stv         | android  | small       | PROGRAMMES BY DAY |
      | stv         | android  | small       | MOST WATCHED      |
      | stv         | android  | small       | SEARCH            |
      | stv         | android  | small       | PROGRAMME INFO    |
      | stv         | android  | small       | EPISODE INFO      |
      | stv         | android  | small       | A - Z             |
      | channel     | android  | small       | CRUCIAL CATCHUP   |
      | channel     | android  | small       | ITV1              |
      | channel     | android  | small       | ITV2              |
      | channel     | android  | small       | ITV3              |
      | channel     | android  | small       | ITV4              |
      | channel     | android  | small       | CITV              |
      | channel     | android  | small       | PROGRAMMES BY DAY |
      | channel     | android  | small       | MOST WATCHED      |
      | channel     | android  | small       | SEARCH            |
      | channel     | android  | small       | PROGRAMME INFO    |
      | channel     | android  | small       | EPISODE INFO      |
      | channel     | android  | small       | A - Z             |
      | unknown     | android  | small       | CRUCIAL CATCHUP   |
      | unknown     | android  | small       | ITV2              |
      | unknown     | android  | small       | ITV3              |
      | unknown     | android  | small       | ITV4              |
      | unknown     | android  | small       | CITV              |
      | unknown     | android  | small       | PROGRAMMES BY DAY |
      | unknown     | android  | small       | MOST WATCHED      |
      | unknown     | android  | small       | SEARCH            |
      | unknown     | android  | small       | PROGRAMME INFO    |
      | unknown     | android  | small       | EPISODE INFO      |
      | unknown     | android  | small       | A - Z             |
      | itv         | android  | big         | CRUCIAL CATCHUP   |
      | itv         | android  | big         | ITV1              |
      | itv         | android  | big         | ITV2              |
      | itv         | android  | big         | ITV3              |
      | itv         | android  | big         | ITV4              |
      | itv         | android  | big         | CITV              |
      | itv         | android  | big         | PROGRAMMES BY DAY |
      | itv         | android  | big         | MOST WATCHED      |
      | itv         | android  | big         | SEARCH            |
      | itv         | android  | big         | PROGRAMME INFO    |
      | itv         | android  | big         | EPISODE INFO      |
      | itv         | android  | big         | A - Z             |
      | utv         | android  | big         | CRUCIAL CATCHUP   |
      | utv         | android  | big         | ITV2              |
      | utv         | android  | big         | ITV3              |
      | utv         | android  | big         | ITV4              |
      | utv         | android  | big         | CITV              |
      | utv         | android  | big         | PROGRAMMES BY DAY |
      | utv         | android  | big         | MOST WATCHED      |
      | utv         | android  | big         | SEARCH            |
      | utv         | android  | big         | PROGRAMME INFO    |
      | utv         | android  | big         | EPISODE INFO      |
      | utv         | android  | big         | A - Z             |
      | stv         | android  | big         | CRUCIAL CATCHUP   |
      | stv         | android  | big         | ITV2              |
      | stv         | android  | big         | ITV3              |
      | stv         | android  | big         | ITV4              |
      | stv         | android  | big         | CITV              |
      | stv         | android  | big         | PROGRAMMES BY DAY |
      | stv         | android  | big         | MOST WATCHED      |
      | stv         | android  | big         | SEARCH            |
      | stv         | android  | big         | PROGRAMME INFO    |
      | stv         | android  | big         | EPISODE INFO      |
      | stv         | android  | big         | A - Z             |
      | channel     | android  | big         | CRUCIAL CATCHUP   |
      | channel     | android  | big         | ITV1              |
      | channel     | android  | big         | ITV2              |
      | channel     | android  | big         | ITV3              |
      | channel     | android  | big         | ITV4              |
      | channel     | android  | big         | CITV              |
      | channel     | android  | big         | PROGRAMMES BY DAY |
      | channel     | android  | big         | MOST WATCHED      |
      | channel     | android  | big         | SEARCH            |
      | channel     | android  | big         | PROGRAMME INFO    |
      | channel     | android  | big         | EPISODE INFO      |
      | channel     | android  | big         | A - Z             |
      | unknown     | android  | big         | CRUCIAL CATCHUP   |
      | unknown     | android  | big         | ITV2              |
      | unknown     | android  | big         | ITV3              |
      | unknown     | android  | big         | ITV4              |
      | unknown     | android  | big         | CITV              |
      | unknown     | android  | big         | PROGRAMMES BY DAY |
      | unknown     | android  | big         | MOST WATCHED      |
      | unknown     | android  | big         | SEARCH            |
      | unknown     | android  | big         | PROGRAMME INFO    |
      | unknown     | android  | big         | EPISODE INFO      |
      | unknown     | android  | big         | A - Z             |

  Scenario Outline: DN-221 Verify that the correct urls are available for a certain broadcaster for Android
    Given I request the content for <broadcaster> and <platform>
    Then the masterfeed should contain the expected <links>

    Examples:
      | broadcaster | platform | links                      |
      | itv         | android  | Episode/Crucial            |
      | itv         | android  | Episode/MostWatched        |
      | itv         | android  | Programme/PerChannel/itv1  |
      | itv         | android  | Programme/PerChannel/itv2  |
      | itv         | android  | Programme/PerChannel/itv3  |
      | itv         | android  | Programme/PerChannel/itv4  |
      | itv         | android  | Programme/PerChannel/citv  |
      | itv         | android  | Programme/Search           |
      | itv         | android  | Programme/SearchAtoZ       |
      | channel     | android  | Episode/Crucial            |
      | channel     | android  | Episode/MostWatched        |
      | channel     | android  | Programme/PerChannel/itv1  |
      | channel     | android  | Programme/PerChannel/itv2  |
      | channel     | android  | Programme/PerChannel/itv3  |
      | channel     | android  | Programme/PerChannel/itv4  |
      | channel     | android  | Programme/PerChannel/citv  |
      | channel     | android  | Programme/Search           |
      | channel     | android  | Programme/SearchAtoZ       |

  Scenario Outline: DN-221 Verify that the correct urls are available for a certain broadcaster for Android
    Given I request the content for <broadcaster> and <platform>
    Then the masterfeed should contain the expected <links>

    Examples:
      | broadcaster | platform | links                      |
      | stv         | android  | Episode/Crucial            |
      | stv         | android  | Episode/MostWatched        |
      | stv         | android  | Programme/PerChannel/itv2  |
      | stv         | android  | Programme/PerChannel/itv3  |
      | stv         | android  | Programme/PerChannel/itv4  |
      | stv         | android  | Programme/PerChannel/citv  |
      | stv         | android  | Programme/Search           |
      | stv         | android  | Programme/SearchAtoZ       |
      | utv         | android  | Episode/Crucial            |
      | utv         | android  | Episode/MostWatched        |
      | utv         | android  | Programme/PerChannel/itv2  |
      | utv         | android  | Programme/PerChannel/itv3  |
      | utv         | android  | Programme/PerChannel/itv4  |
      | utv         | android  | Programme/PerChannel/citv  |
      | utv         | android  | Programme/Search           |
      | utv         | android  | Programme/SearchAtoZ       |


  Scenario Outline: Verify that the correct urls are available for a certain broadcaster for Mobile
    Given I request the content for <broadcaster> and <platform> with <screen size>
    Then the masterfeed should contain the expected <links>

    Examples:
      | broadcaster | platform | screen size | links                      |
      | itv         | mobile   | small       | Episode/Crucial            |
      | itv         | mobile   | small       | Episode/MostWatched        |
      | itv         | mobile   | small       | Programme/PerChannel/itv1  |
      | itv         | mobile   | small       | Programme/PerChannel/itv2  |
      | itv         | mobile   | small       | Programme/PerChannel/itv3  |
      | itv         | mobile   | small       | Programme/PerChannel/itv4  |
      | itv         | mobile   | small       | Programme/PerChannel/citv  |
      | itv         | mobile   | small       | Programme/Search           |
      | itv         | mobile   | small       | Programme/SearchAtoZ       |
      | stv         | mobile   | small       | Episode/Crucial            |
      | stv         | mobile   | small       | Episode/MostWatched        |
      | stv         | mobile   | small       | Programme/PerChannel/itv2  |
      | stv         | mobile   | small       | Programme/PerChannel/itv3  |
      | stv         | mobile   | small       | Programme/PerChannel/itv4  |
      | stv         | mobile   | small       | Programme/PerChannel/citv  |
      | stv         | mobile   | small       | Programme/Search           |
      | stv         | mobile   | small       | Programme/SearchAtoZ       |
      | utv         | mobile   | small       | Episode/Crucial            |
      | utv         | mobile   | small       | Episode/MostWatched        |
      | utv         | mobile   | small       | Programme/PerChannel/itv2  |
      | utv         | mobile   | small       | Programme/PerChannel/itv3  |
      | utv         | mobile   | small       | Programme/PerChannel/itv4  |
      | utv         | mobile   | small       | Programme/PerChannel/citv  |
      | utv         | mobile   | small       | Programme/Search           |
      | utv         | mobile   | small       | Programme/SearchAtoZ       |
      | channel     | mobile   | small       | Episode/Crucial            |
      | channel     | mobile   | small       | Episode/MostWatched        |
      | channel     | mobile   | small       | Programme/PerChannel/itv2  |
      | channel     | mobile   | small       | Programme/PerChannel/itv3  |
      | channel     | mobile   | small       | Programme/PerChannel/itv4  |
      | channel     | mobile   | small       | Programme/PerChannel/citv  |
      | channel     | mobile   | small       | Programme/Search           |
      | channel     | mobile   | small       | Programme/SearchAtoZ       |
      | itv         | mobile   | big         | Episode/Crucial            |
      | itv         | mobile   | big         | Episode/MostWatched        |
      | itv         | mobile   | big         | Programme/PerChannel/itv1  |
      | itv         | mobile   | big         | Programme/PerChannel/itv2  |
      | itv         | mobile   | big         | Programme/PerChannel/itv3  |
      | itv         | mobile   | big         | Programme/PerChannel/itv4  |
      | itv         | mobile   | big         | Programme/PerChannel/citv  |
      | itv         | mobile   | big         | Programme/Search           |
      | itv         | mobile   | big         | Programme/SearchAtoZ       |
      | stv         | mobile   | big         | Episode/Crucial            |
      | stv         | mobile   | big         | Episode/MostWatched        |
      | stv         | mobile   | big         | Programme/PerChannel/itv2  |
      | stv         | mobile   | big         | Programme/PerChannel/itv3  |
      | stv         | mobile   | big         | Programme/PerChannel/itv4  |
      | stv         | mobile   | big         | Programme/PerChannel/citv  |
      | stv         | mobile   | big         | Programme/Search           |
      | stv         | mobile   | big         | Programme/SearchAtoZ       |
      | utv         | mobile   | big         | Episode/Crucial            |
      | utv         | mobile   | big         | Episode/MostWatched        |
      | utv         | mobile   | big         | Programme/PerChannel/itv2  |
      | utv         | mobile   | big         | Programme/PerChannel/itv3  |
      | utv         | mobile   | big         | Programme/PerChannel/itv4  |
      | utv         | mobile   | big         | Programme/PerChannel/citv  |
      | utv         | mobile   | big         | Programme/Search           |
      | utv         | mobile   | big         | Programme/SearchAtoZ       |
      | channel     | mobile   | big         | Episode/Crucial            |
      | channel     | mobile   | big         | Episode/MostWatched        |
      | channel     | mobile   | big         | Programme/PerChannel/itv2  |
      | channel     | mobile   | big         | Programme/PerChannel/itv3  |
      | channel     | mobile   | big         | Programme/PerChannel/itv4  |
      | channel     | mobile   | big         | Programme/PerChannel/citv  |
      | channel     | mobile   | big         | Programme/Search           |
      | channel     | mobile   | big         | Programme/SearchAtoZ       |

  Scenario Outline: Verify that the correct urls are available for a certain broadcaster for Samsung
    Given I request the content for <broadcaster> and <platform>
    Then the masterfeed should contain the expected <links>

    Examples:
      | broadcaster | platform  | links                      |
      | itv         | samsung   | Episode/Crucial            |
      | itv         | samsung   | Episode/MostWatched        |
      | itv         | samsung   | Programme/PerChannel/itv1  |
      | itv         | samsung   | Programme/PerChannel/itv2  |
      | itv         | samsung   | Programme/PerChannel/itv3  |
      | itv         | samsung   | Programme/PerChannel/itv4  |
      | itv         | samsung   | Programme/PerChannel/citv  |
      | itv         | samsung   | AToZ                       |
      | stv         | samsung   | Episode/Crucial            |
      | stv         | samsung   | Episode/MostWatched        |
      | stv         | samsung   | Programme/PerChannel/itv1  |
      | stv         | samsung   | Programme/PerChannel/itv2  |
      | stv         | samsung   | Programme/PerChannel/itv3  |
      | stv         | samsung   | Programme/PerChannel/itv4  |
      | stv         | samsung   | Programme/PerChannel/citv  |
      | stv         | samsung   | AToZ                       |
      | utv         | samsung   | Episode/Crucial            |
      | utv         | samsung   | Episode/MostWatched        |
      | utv         | samsung   | Programme/PerChannel/itv1  |
      | utv         | samsung   | Programme/PerChannel/itv2  |
      | utv         | samsung   | Programme/PerChannel/itv3  |
      | utv         | samsung   | Programme/PerChannel/itv4  |
      | utv         | samsung   | Programme/PerChannel/citv  |
      | utv         | samsung   | AToZ                       |
      | channel     | samsung   | Episode/Crucial            |
      | channel     | samsung   | Episode/MostWatched        |
      | channel     | samsung   | Programme/PerChannel/itv1  |
      | channel     | samsung   | Programme/PerChannel/itv2  |
      | channel     | samsung   | Programme/PerChannel/itv3  |
      | channel     | samsung   | Programme/PerChannel/itv4  |
      | channel     | samsung   | Programme/PerChannel/citv  |
      | channel     | samsung   | AToZ                       |

  Scenario Outline: Verify that the correct urls are available for a certain broadcaster for YouView
    Given I request the content for <broadcaster> and <platform>
    Then the masterfeed should contain the expected <links>

    Examples:
      | broadcaster | platform | links                       |
      | itv         | youview   | Episode/Crucial            |
      | itv         | youview   | Episode/MostWatched        |
      | itv         | youview   | Programme/PerChannel/itv1  |
      | itv         | youview   | Programme/PerChannel/itv2  |
      | itv         | youview   | Programme/PerChannel/itv3  |
      | itv         | youview   | Programme/PerChannel/itv4  |
      | itv         | youview   | Programme/PerChannel/citv  |
      | itv         | youview   | AToZ                       |
      | stv         | youview   | Episode/Crucial            |
      | stv         | youview   | Episode/MostWatched        |
      | stv         | youview   | Programme/PerChannel/itv1  |
      | stv         | youview   | Programme/PerChannel/itv2  |
      | stv         | youview   | Programme/PerChannel/itv3  |
      | stv         | youview   | Programme/PerChannel/itv4  |
      | stv         | youview   | Programme/PerChannel/citv  |
      | stv         | youview   | AToZ                       |
      | utv         | youview   | Episode/Crucial            |
      | utv         | youview   | Episode/MostWatched        |
      | utv         | youview   | Programme/PerChannel/itv1  |
      | utv         | youview   | Programme/PerChannel/itv2  |
      | utv         | youview   | Programme/PerChannel/itv3  |
      | utv         | youview   | Programme/PerChannel/itv4  |
      | utv         | youview   | Programme/PerChannel/citv  |
      | utv         | youview   | AToZ                       |
      | channel     | youview   | Episode/Crucial            |
      | channel     | youview   | Episode/MostWatched        |
      | channel     | youview   | Programme/PerChannel/itv1  |
      | channel     | youview   | Programme/PerChannel/itv2  |
      | channel     | youview   | Programme/PerChannel/itv3  |
      | channel     | youview   | Programme/PerChannel/itv4  |
      | channel     | youview   | Programme/PerChannel/citv  |
      | channel     | youview   | AToZ                       |

