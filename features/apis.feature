Feature: API and MRSS feeds
  In order to generate front end features
  As a backend enabler
  I want to be able to provide appropriate API's

  Scenario Outline: Verify API's across Dotcom

    Given I request the <type> <platform> <uri> api
    Then I get a successful <type> response with the correct <platform>

  Examples:
    | type | platform | uri                                   |
    | xml  | DotCom   | Episode/Crucial                       |
    | xml  | DotCom   | Episode/mostwatched                   |
    | xml  | DotCom   | Programme/PerChannel/itv1             |
    | xml  | DotCom   | Programme/PerChannel/itv2             |
    | xml  | DotCom   | Programme/PerChannel/itv3             |
    | xml  | DotCom   | Programme/PerChannel/itv4             |
    | xml  | DotCom   | Programme/PerChannel/citv             |
    | xml  | DotCom   | episode/programme/coronation%20street |
    | xml  | DotCom   | programme/searchAtoZ/def              |
    | xml  | DotCom   | episode/programme/254270              |
    | json | DotCom   | Episode/Crucial                       |
    | json | DotCom   | Episode/mostwatched                   |
    | json | DotCom   | Programme/PerChannel/itv1             |
    | json | DotCom   | Programme/PerChannel/itv2             |
    | json | DotCom   | Programme/PerChannel/itv3             |
    | json | DotCom   | Programme/PerChannel/itv4             |
    | json | DotCom   | Programme/PerChannel/citv             |
    | json | DotCom   | episode/programme/coronation%20street |
    | json | DotCom   | programme/searchAtoZ/def              |
    | json | DotCom   | episode/programme/254270              |


  Scenario Outline: verify API's across PS3
    Given I request the <type> <platform> <uri> api
    Then I get a successful <type> response with the correct <platform>

  Examples:
    | type | platform | uri                                   |
    | xml  | PS3      | Episode/Crucial                       |
    | xml  | PS3      | Episode/mostwatched                   |
    | xml  | PS3      | Programme/PerChannel/itv1             |
    | xml  | PS3      | Programme/PerChannel/itv2             |
    | xml  | PS3      | Programme/PerChannel/itv3             |
    | xml  | PS3      | Programme/PerChannel/itv4             |
    | xml  | PS3      | Programme/PerChannel/citv             |
    | xml  | PS3      | episode/programme/coronation%20street |
    | xml  | PS3      | programme/searchAtoZ/abc              |
    | xml  | PS3      | episode/programme/255247              |
    | xml  | PS3      | episode/Bydate/2012/02/01             |


  Scenario Outline: verify API's across YouView
    Given I request the <type> <platform> <uri> api
    Then I get a successful <type> response with the correct <platform>

  Examples:
    | type | platform | uri                                              |
    | xml  | youview  | Episode/Crucial                                  |
    | xml  | youview  | Episode/Crucial/?broadcaster=Stv                 |
    | xml  | youview  | Episode/Crucial/?broadcaster=itv                 |
    | xml  | youview  | Episode/Crucial/?broadcaster=utv                 |
    | xml  | youview  | Episode/Crucial/?broadcaster=channel             |
    | xml  | youview  | Episode/Crucial/?broadcaster=unknown             |
    | xml  | youview  | Episode/mostwatched                              |
    | xml  | youview  | Programme/PerChannel/itv1                        |
    | xml  | youview  | Programme/PerChannel/itv2                        |
    | xml  | youview  | Programme/PerChannel/itv3                        |
    | xml  | youview  | Programme/PerChannel/itv4                        |
    | xml  | youview  | Programme/PerChannel/citv                        |
    | xml  | youview  | Episode/programme/coronation%20street            |
    | xml  | youview  | programme/searchAtoZ/abc                         |
    | xml  | youview  | Episode/programme/254270                         |
    | xml  | youview  | episode/Bydate/2012/02/01                        |
    | xml  | youview  | episode/Bydate/2012/04/03?broadcaster=itv        |
    | xml  | youview  | Episode/mostwatched/?broadcaster=Stv             |
    | xml  | youview  | programme/Perchannel/itv1?broadcaster=itv        |
    | xml  | youview  | programme/searchAtoZ/abc?broadcaster=Stv         |
    | xml  | youview  | episode/programme/GIR%20Street_2?broadcaster=itv |
    | xml  | youview  | Programme/SearchAtoZ/AB                          |


  Scenario Outline: verify API's across Samsung
    Given I request the <type> <platform> <uri> api
    Then I get a successful <type> response with the correct <platform>

  Examples:
    | type | platform | uri                                                       |
    | xml  | samsung  | Episode/Crucial                                           |
    | xml  | samsung  | Episode/Crucial/?broadcaster=Stv                          |
    | xml  | samsung  | Episode/Crucial/?broadcaster=utv                          |
    | xml  | samsung  | Episode/Crucial/?broadcaster=itv                          |
    | xml  | samsung  | Episode/Crucial/?broadcaster=channel                      |
    | xml  | samsung  | Episode/Crucial/?broadcaster=unknown                      |
    | xml  | samsung  | Episode/mostwatched                                       |
    | xml  | samsung  | Programme/PerChannel/itv1                                 |
    | xml  | samsung  | Programme/PerChannel/itv2                                 |
    | xml  | samsung  | Programme/PerChannel/itv3                                 |
    | xml  | samsung  | Programme/PerChannel/itv4                                 |
    | xml  | samsung  | Programme/PerChannel/citv                                 |
    | xml  | samsung  | Episode/programme/coronation%20street                     |
    | xml  | samsung  | programme/searchAtoZ/abc                                  |
    | xml  | samsung  | Episode/programme/254270                                  |
    | xml  | samsung  | episode/Bydate/2012/07/23?broadcaster=itv                 |
    | xml  | samsung  | episode/Bydate/2012/04/03?broadcaster=itv                 |
    | xml  | samsung  | Episode/mostwatched/?broadcaster=Stv                      |
    | xml  | samsung  | programme/Perchannel/itv1?broadcaster=itv                 |
    | xml  | samsung  | episode/programme/255555?broadcaster=itv                  |
    | xml  | samsung  | programme/searchAtoZ/abc?broadcaster=Stv                  |
    | xml  | samsung  | episode/programme/RC3SamsungTestSeriesOne?broadcaster=itv |
    | xml  | samsung  | Programme/SearchAtoZ/AB                                   |


  Scenario Outline: verify API's across Mobile
    Given I request the <type> <platform> <uri> api
    Then I get a successful <type> response with the correct <platform>

  Examples:
    | type | platform | uri                                                        |
    | xml  | mobile   | Episode/Crucial?screensize=big&broadcaster=utv             |
    | xml  | mobile   | Episode/Crucial?screensize=small&broadcaster=utv           |
    | xml  | mobile   | episode/mostwatched?broadcaster=Itv&screensize=Small       |
    | xml  | mobile   | episode/mostwatched?broadcaster=Itv&screensize=Big         |
    | xml  | mobile   | episode/bydate/2012/02/01?broadcaster=ITV&screensize=small |
    | xml  | mobile   | episode/bydate/2012/02/01?broadcaster=ITV&screensize=big   |
    | xml  | mobile   | Programme/SearchAtoZ/def?screensize=big&broadcaster=stv    |
    | xml  | mobile   | Programme/SearchAtoZ/def?screensize=small&broadcaster=stv  |
    | xml  | mobile   | episode/programme/255247?broadcaster=ITV&screensize=small  |
    | xml  | mobile   | episode/programme/255247?broadcaster=ITV&screensize=big    |


  Scenario Outline: verify API's across Freesat
    Given I request the <type> <platform> <uri> api
    Then I get a successful <type> response with the correct <platform>

  Examples:
    | type     | platform | uri                                             |
    | mhegdata | freesat  | Episode/Crucial                                 |
    | mhegdata | freesat  | episode/mostwatched                             |
    | mhegdata | freesat  | programme/perchannel/ITV1                       |
    | mhegdata | freesat  | programme/perchannel/ITV2                       |
    | mhegdata | freesat  | programme/perchannel/ITV3                       |
    | mhegdata | freesat  | programme/perchannel/ITV4                       |
    | mhegdata | freesat  | programme/searchatoz/abc                        |
    | mhegdata | freesat  | programme/searchatoz/abcdefghijklmnopqrstuvwxyz |
    | mhegdata | freesat  | episode/programme/255488                        |


  Scenario Outline: Verify production ID's are returned
    Given I request the <type> <platform> <uri> api
    Then the response should contain production id <production id>

  Examples:
    | type | platform | production id   | uri                                      |
    | xml  | youview  | 1/5072/9102#001 | episode/programme/255423?broadcaster=ITV |
    | xml  | youview  | 1/5072/9102#001 | episode/indexes/255423?broadcaster=ITV   |
    | xml  | dotcom   | 1/9311/0054#001 | episode/programme/coronation%20street    |


  Scenario Outline: Verify LastWeek feed across platforms
    Given I request the <type> <platform> <uri> api
    Then the response should contain entries for each of the last 7 days

  Examples:
    | type | platform | uri      |
    | xml  | youview  | LastWeek |
    | xml  | samsung  | LastWeek |


  Scenario Outline:  Verify A to Z feed across platforms
    Given I request the <type> <platform> <uri> api
    Then the response should contain a complete A-Z listing

  Examples:
    | type | platform | uri   |
    | xml  | samsung  | AToZ/ |
    | xml  | youview  | AToZ/ |


  Scenario Outline: Verify MRSS feed
    Given I request the mrss <uri> api
    Then the response should contain the correct <title>

  Examples:
    | uri               | title                 |
    | /linking/20120723 | ITV Daily Change Feed |


Scenario Outline: Verify correct broadcaster service
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
  | itv         | samsung  | small       | ITV1              |
  | itv         | samsung  | small       | ITV2              |
  | itv         | samsung  | small       | ITV3              |
  | itv         | samsung  | small       | ITV4              |
  | itv         | samsung  | small       | CITV              |
  | itv         | samsung  | small       | A - Z             |
  | itv         | samsung  | small       | Most Popular      |
  | itv         | samsung  | small       | Don't Miss        |
  | itv         | samsung  | small       | By Day            |
  | utv         | samsung  | small       | ITV1              |
  | utv         | samsung  | small       | ITV2              |
  | utv         | samsung  | small       | ITV3              |
  | utv         | samsung  | small       | ITV4              |
  | utv         | samsung  | small       | CITV              |
  | utv         | samsung  | small       | A - Z             |
  | utv         | samsung  | small       | Most Popular      |
  | utv         | samsung  | small       | Don't Miss        |
  | utv         | samsung  | small       | By Day            |
  | stv         | samsung  | small       | ITV1              |
  | stv         | samsung  | small       | ITV2              |
  | stv         | samsung  | small       | ITV3              |
  | stv         | samsung  | small       | ITV4              |
  | stv         | samsung  | small       | CITV              |
  | stv         | samsung  | small       | A - Z             |
  | stv         | samsung  | small       | Most Popular      |
  | stv         | samsung  | small       | Don't Miss        |
  | stv         | samsung  | small       | By Day            |
  | channel     | samsung  | small       | ITV1              |
  | channel     | samsung  | small       | ITV2              |
  | channel     | samsung  | small       | ITV3              |
  | channel     | samsung  | small       | ITV4              |
  | channel     | samsung  | small       | CITV              |
  | channel     | samsung  | small       | A - Z             |
  | channel     | samsung  | small       | Most Popular      |
  | channel     | samsung  | small       | Don't Miss        |
  | channel     | samsung  | small       | By Day            |
  | unknown     | samsung  | small       | ITV1              |
  | unknown     | samsung  | small       | ITV2              |
  | unknown     | samsung  | small       | ITV3              |
  | unknown     | samsung  | small       | ITV4              |
  | unknown     | samsung  | small       | CITV              |
  | unknown     | samsung  | small       | A - Z             |
  | unknown     | samsung  | small       | Most Popular      |
  | unknown     | samsung  | small       | Don't Miss        |
  | unknown     | samsung  | small       | By Day            |
  | itv         | samsung  | small       | Last Watched      |
  | itv         | samsung  | big         | Last Watched      |
  | itv         | samsung  | big         | ITV1              |
  | itv         | samsung  | big         | ITV2              |
  | itv         | samsung  | big         | ITV3              |
  | itv         | samsung  | big         | ITV4              |
  | itv         | samsung  | big         | CITV              |
  | itv         | samsung  | big         | A - Z             |
  | itv         | samsung  | big         | Most Popular      |
  | itv         | samsung  | big         | Don't Miss        |
  | itv         | samsung  | big         | By Day            |
  | utv         | samsung  | big         | ITV1              |
  | utv         | samsung  | big         | ITV2              |
  | utv         | samsung  | big         | ITV3              |
  | utv         | samsung  | big         | ITV4              |
  | utv         | samsung  | big         | CITV              |
  | utv         | samsung  | big         | A - Z             |
  | utv         | samsung  | big         | Most Popular      |
  | utv         | samsung  | big         | Don't Miss        |
  | utv         | samsung  | big         | By Day            |
  | stv         | samsung  | big         | ITV1              |
  | stv         | samsung  | big         | ITV2              |
  | stv         | samsung  | big         | ITV3              |
  | stv         | samsung  | big         | ITV4              |
  | stv         | samsung  | big         | CITV              |
  | stv         | samsung  | big         | A - Z             |
  | stv         | samsung  | big         | Most Popular      |
  | stv         | samsung  | big         | Don't Miss        |
  | stv         | samsung  | big         | By Day            |
  | channel     | samsung  | big         | ITV1              |
  | channel     | samsung  | big         | ITV2              |
  | channel     | samsung  | big         | ITV3              |
  | channel     | samsung  | big         | ITV4              |
  | channel     | samsung  | big         | CITV              |
  | channel     | samsung  | big         | A - Z             |
  | channel     | samsung  | big         | Most Popular      |
  | channel     | samsung  | big         | Don't Miss        |
  | channel     | samsung  | big         | By Day            |
  | unknown     | samsung  | big         | ITV1              |
  | unknown     | samsung  | big         | ITV2              |
  | unknown     | samsung  | big         | ITV3              |
  | unknown     | samsung  | big         | ITV4              |
  | unknown     | samsung  | big         | CITV              |
  | unknown     | samsung  | big         | A - Z             |
  | unknown     | samsung  | big         | Most Popular      |
  | unknown     | samsung  | big         | Don't Miss        |
  | unknown     | samsung  | big         | By Day            |
  | itv         | youview  | small       | ITV1              |
  | itv         | youview  | small       | ITV2              |
  | itv         | youview  | small       | ITV3              |
  | itv         | youview  | small       | ITV4              |
  | itv         | youview  | small       | CITV              |
  | itv         | youview  | small       | A - Z             |
  | itv         | youview  | small       | Most Popular      |
  | itv         | youview  | small       | Don't Miss        |
  | itv         | youview  | small       | By Day            |
  | utv         | youview  | small       | ITV1              |
  | utv         | youview  | small       | ITV2              |
  | utv         | youview  | small       | ITV3              |
  | utv         | youview  | small       | ITV4              |
  | utv         | youview  | small       | CITV              |
  | utv         | youview  | small       | A - Z             |
  | utv         | youview  | small       | Most Popular      |
  | utv         | youview  | small       | Don't Miss        |
  | utv         | youview  | small       | By Day            |
  | stv         | youview  | small       | ITV1              |
  | stv         | youview  | small       | ITV2              |
  | stv         | youview  | small       | ITV3              |
  | stv         | youview  | small       | ITV4              |
  | stv         | youview  | small       | CITV              |
  | stv         | youview  | small       | A - Z             |
  | stv         | youview  | small       | Most Popular      |
  | stv         | youview  | small       | Don't Miss        |
  | stv         | youview  | small       | By Day            |
  | channel     | youview  | small       | ITV1              |
  | channel     | youview  | small       | ITV2              |
  | channel     | youview  | small       | ITV3              |
  | channel     | youview  | small       | ITV4              |
  | channel     | youview  | small       | CITV              |
  | channel     | youview  | small       | A - Z             |
  | channel     | youview  | small       | Most Popular      |
  | channel     | youview  | small       | Don't Miss        |
  | channel     | youview  | small       | By Day            |
  | unknown     | youview  | small       | ITV1              |
  | unknown     | youview  | small       | ITV2              |
  | unknown     | youview  | small       | ITV3              |
  | unknown     | youview  | small       | ITV4              |
  | unknown     | youview  | small       | CITV              |
  | unknown     | youview  | small       | A - Z             |
  | unknown     | youview  | small       | Most Popular      |
  | unknown     | youview  | small       | Don't Miss        |
  | unknown     | youview  | small       | By Day            |
  | itv         | youview  | small       | Last Watched      |
  | itv         | youview  | big         | Last Watched      |
  | itv         | youview  | big         | ITV1              |
  | itv         | youview  | big         | ITV2              |
  | itv         | youview  | big         | ITV3              |
  | itv         | youview  | big         | ITV4              |
  | itv         | youview  | big         | CITV              |
  | itv         | youview  | big         | A - Z             |
  | itv         | youview  | big         | Most Popular      |
  | itv         | youview  | big         | Don't Miss        |
  | itv         | youview  | big         | By Day            |
  | utv         | youview  | big         | ITV1              |
  | utv         | youview  | big         | ITV2              |
  | utv         | youview  | big         | ITV3              |
  | utv         | youview  | big         | ITV4              |
  | utv         | youview  | big         | CITV              |
  | utv         | youview  | big         | A - Z             |
  | utv         | youview  | big         | Most Popular      |
  | utv         | youview  | big         | Don't Miss        |
  | utv         | youview  | big         | By Day            |
  | stv         | youview  | big         | ITV1              |
  | stv         | youview  | big         | ITV2              |
  | stv         | youview  | big         | ITV3              |
  | stv         | youview  | big         | ITV4              |
  | stv         | youview  | big         | CITV              |
  | stv         | youview  | big         | A - Z             |
  | stv         | youview  | big         | Most Popular      |
  | stv         | youview  | big         | Don't Miss        |
  | stv         | youview  | big         | By Day            |
  | channel     | youview  | big         | ITV1              |
  | channel     | youview  | big         | ITV2              |
  | channel     | youview  | big         | ITV3              |
  | channel     | youview  | big         | ITV4              |
  | channel     | youview  | big         | CITV              |
  | channel     | youview  | big         | A - Z             |
  | channel     | youview  | big         | Most Popular      |
  | channel     | youview  | big         | Don't Miss        |
  | channel     | youview  | big         | By Day            |
  | unknown     | youview  | big         | ITV1              |
  | unknown     | youview  | big         | ITV2              |
  | unknown     | youview  | big         | ITV3              |
  | unknown     | youview  | big         | ITV4              |
  | unknown     | youview  | big         | CITV              |
  | unknown     | youview  | big         | A - Z             |
  | unknown     | youview  | big         | Most Popular      |
  | unknown     | youview  | big         | Don't Miss        |
  | unknown     | youview  | big         | By Day            |


  Scenario Outline: Verify ITV1 is not available for STV or UTV
    Given I request the content for <broadcaster> and <platform> with <screen size>
    Then the response should not contain <content>

  Examples:
    | broadcaster | platform | screen size | content           |
    | utv         | mobile   | small       | ITV1              |
    | stv         | mobile   | small       | ITV1              |
    | channel     | mobile   | small       | ITV1              |
    | unknown     | mobile   | small       | ITV1              |
