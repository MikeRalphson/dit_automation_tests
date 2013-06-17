@live
Feature: Broadcaster API feeds
  In order to validate the correct broadcasts
  As a backend enabler
  I must ensure the appropriate broadcasts are transmitted per region

  Scenario Outline: Verify correct broadcaster service for Mobile
    Given I request the master feed for ITV and Mobile with <screen size>
    Then the response should include the mobile app feeds

  Examples:
    | screen size |
    | small       |
    | big         |

  Scenario Outline: Verify correct broadcaster service for YouView
    Given I request the master feed for YouView and <broadcaster>
    Then the response should include all the standard feeds

  Examples:
    | broadcaster |
    | itv         |
    | utv         |
    | stv         |
    | channel     |
    | unknown     |

  Scenario Outline: Verify correct broadcaster service for Samsung
    Given I request the master feed for Samsung and <broadcaster>
    Then the response should include all the standard feeds

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

  Scenario Outline: Verify ITV1 is not available for STV or UTV for Android
    Given I request the master feed for Android and <broadcaster>
    Then the response should include the mobile app feeds excluding ITV1

  Examples:
    | broadcaster |
    | utv         |
    | stv         |
    | unknown     |

  Scenario Outline: Verify ITV1 is not available for STV or UTV for Mobile
    Given I request the master feed for <broadcaster> and Mobile with <screen size>
    Then the response should include the mobile app feeds excluding ITV1

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
