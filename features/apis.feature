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
    | xml  | dotcom   | 1/5163/1272#001 | whatsonschedule/today                    |


  Scenario Outline: Verify LastWeek feed across platforms
    Given I request the <type> <platform> <uri> api
    Then the response should contain entries for each of the last 7 days

  Examples:
    | type | platform | uri      |
    | xml  | youview  | LastWeek |
    | xml  | samsung  | LastWeek |


  Scenario Outline:  Verify A to Z feed across platforms
    Given I request the <type> <platform> <uri> api
    Then the response should contain content...TODO

  Examples:
    | type | platform | uri                     |
    | xml  | youview  | Programme/SearchAtoZ/AB |
    | xml  | samsung  | Programme/SearchAtoZ/AB |
    | xml  | samsung  | AToZ/                   |


  Scenario Outline: Verify MRSS feed
    Given I request the mrss <uri> api
    Then the response should contain <number of groups> or more MRSS groups

  Examples:
    | uri               |
    | /linking/20110830 |


#    Scenario Scenario Outline: Carousel...to do
#    | xml  | mobile   | ?broadcaster=ITV&screensize=small                          |
#    | xml  | mobile   | ?broadcaster=ITV&screensize=big                            |
