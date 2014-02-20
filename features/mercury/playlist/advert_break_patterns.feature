@break-pattern
Feature: Advert Break Pattern Management in Mercury Playlist Requests
  In order to display adverts in videos
  As a client
  I want to be able to get ad server urls in playlist response

  Scenario Outline: Absolute break pattern
  #  <pattern>
  #    <distribution>P</distribution>
  #    <load>
  #      <generic>
  #        <i type="integer"></i>
  #        <pr type="integer"></pr>
  #        <s type="integer"></s>
  #        <m type="integer"></m>
  #        <po type="integer"></po>
  #      </generic>
  #      <absolute>IASS:AAA:SAAAS:AAS:SS</absolute>
  #    </load>
  #  </pattern>
    Given I have ingested a piece of <platform> catchup content with 3 content breaks (i.e. 4 parts)
    And I have an absolute break pattern for that content configured on the adserver
    When I request the Mercury playlist
    Then the response returns the correct pattern defined by the absolute break pattern
    And the response returns the correct advert positions for the absolute break pattern
    And the response returns the correct break number for each advert
    And the response returns the standard ad-server type for all adverts
    And the response returns the correct break ID's

  Examples:
    | platform    |
    | Mobile      |
    | DotCom      |
    | YouView     |
#   | Android     |

  Scenario Outline: Generic break pattern
  #  <pattern>
  #    <distribution>P</distribution>
  #    <load>
  #      <generic>
  #        <i type="integer">1</i>
  #        <pr type="integer">5</pr>
  #        <s type="integer">3</s>
  #        <m type="integer">2</m>
  #        <po type="integer">1</po>
  #      </generic>
  #    </load>
  #  </pattern>
    Given I have ingested a piece of <platform> catchup content with 3 content breaks (i.e. 4 parts)
    And I have a generic break pattern for that content configured on the adserver
    When I request the Mercury playlist
    Then the response returns the correct pattern defined by the generic break pattern
    And the response returns the correct advert positions for the generic break pattern
    And the response returns the correct break number for each advert
    And the response returns the standard ad-server type for all adverts
    And the response returns the correct break ID's

  Examples:
    | platform    |
    | Mobile      |
    | DotCom      |
    | YouView     |
#   | Android     |

  Scenario Outline: Generic break pattern with durations
  #  <pattern>
  #    <distribution>P</distribution>
  #    <load>
  #      <generic>
  #        <i type="integer">1</i>
  #        <pr type="duration">150</pr>
  #        <s type="integer">2</s>
  #        <m type="integer">4</m>
  #        <po type="duration">60</po>
  #      </generic>
  #    </load>
  #  </pattern>
    Given I have ingested a piece of <platform> catchup content with 3 content breaks (i.e. 4 parts)
    And I have a generic break pattern with durations for that content configured on the adserver
    When I request the Mercury playlist
    Then the response returns the correct pattern defined by the generic break pattern with durations
    And the response returns the correct advert positions for the generic break pattern with durations
    And the response returns the correct break number for each advert
    And the response returns the duration ad-server for duration adverts but the standard ad-server for the rest
    And the response returns the correct break ID's

  Examples:
  | platform    |
  | Mobile      |
  | DotCom      |
  | YouView     |
# | Android     |

  Scenario Outline: Generic break pattern without sponsors or post-rolls
  #    <pattern>
  #      <distribution>P</distribution>
  #      <load>
  #        <generic>
  #          <i type="integer">1</i>
  #          <pr type="integer">5</pr>
  #          <s type="integer">0</s>
  #          <m type="integer">2</m>
  #          <po type="integer">0</po>
  #        </generic>
  #      </load>
  #    </pattern>
    Given I have ingested a piece of <platform> catchup content with 3 content breaks (i.e. 4 parts)
    And I have a generic break pattern without sponsors or post-rolls for that content configured on the adserver
    When I request the Mercury playlist
    Then the response returns the correct pattern defined by the generic break pattern without sponsors or post-rolls
    And the response returns the correct advert positions without sponsors or post-rolls
    And the response returns the correct break number for each advert
    And the response returns the standard ad-server type for all adverts
    And the response returns the correct break ID's

  Examples:
    | platform    |
    | Mobile      |
    | DotCom      |
    | YouView     |
#   | Android     |

  Scenario: Presence of hard-coded stings
# covered in playlist.feature
