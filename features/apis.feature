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


  Scenario Outline: Verify ITV1 is not available for STV or UTV
    Given I request the content for <broadcaster> and <platform> with <screen size>
    Then the response should not contain <content>

  Examples:
    | broadcaster | platform | screen size | content           |
    | utv         | mobile   | small       | ITV1              |
    | stv         | mobile   | small       | ITV1              |
    | channel     | mobile   | small       | ITV1              |
    | unknown     | mobile   | small       | ITV1              |
