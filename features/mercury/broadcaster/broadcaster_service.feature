@live
@broadcaster
Feature: Broadcaster API feeds
  In order to validate the correct broadcasts
  As a backend enabler
  I must ensure the appropriate broadcasts are transmitted per region

  Scenario Outline: Verify correct broadcaster service for Mobile
    Given I request the master feed for <broadcaster> and <platform> with <screen size>
    Then the response should include the feed <title>

  Examples:
    | broadcaster | platform | screen size | title             |
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
    Given I request the master feed for YouView and <broadcaster>
    Then the response should include all the feeds

  Examples:
    | broadcaster |
    | itv         |
    | utv         |
    | stv         |
    | channel     |
    | unknown     |

  Scenario Outline: Verify correct broadcaster service for Samsung
    Given I request the master feed for Samsung and <broadcaster>
    Then the response should include all the feeds

  Examples:
    | broadcaster |
    | itv         |
    | utv         |
    | stv         |
    | channel     |
    | unknown     |

  Scenario Outline: ITV and Channel Broadcaster service for Android
    Given I request the master feed for Android and <broadcaster>
    Then the response should include the mobile app feeds

  Examples:
    | broadcaster |
    | itv         |
    | channel     |

  Scenario Outline: STV, UTV and unknown broadcaster service for Android
    Given I request the master feed for Android and <broadcaster>
    Then the response should include the mobile app feeds excluding ITV1

  Examples:
    | broadcaster |
    | utv         |
    | stv         |
    | unknown     |

  Scenario Outline: Verify ITV1 is not available for STV or UTV for Mobile
    Given I request the master feed for <broadcaster> and Mobile with <screen size>
    Then the response should not include the ITV1 feed

  Examples:
    | broadcaster | screen size |
    | utv         | small       |
    | stv         | small       |
    | channel     | small       |
    | unknown     | small       |
    | utv         | big         |
    | stv         | big         |
    | channel     | big         |
    | unknown     | big         |

  Scenario Outline: Verify ITV1 is not available for STV or UTV for Android
    Given I request the master feed for Android and <broadcaster>
    Then the response should not include the ITV1 feed

  Examples:
    | broadcaster |
    | utv         |
    | stv         |
    | unknown     |

  Scenario Outline: Verify broadcast service for Android ignores screen size if provided
    Given I request the master feed for <broadcaster> and Android with <screen size>
    Then the response should include the feed <title>

  Examples:
    | broadcaster | platform | screen size | title             |
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
