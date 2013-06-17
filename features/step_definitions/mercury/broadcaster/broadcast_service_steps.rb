Given /^I request the master feed for (\w+) and (\w+) with (\w+)$/ do |broadcaster, platform, screen_size|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?screensize=#{screen_size}&broadcaster=#{broadcaster}"
  @response = open(@uri).read
end

Given /^I request the master feed for (\w+) and (\w+)$/ do |platform, broadcaster|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?broadcaster=#{broadcaster}"
  @response = open(@uri).read
end

Then(/^the response should include all the standard feeds$/) do
  feeds = ['ITV1', 'ITV2', 'ITV3', 'ITV4', 'CITV', 'A - Z', 'Most Popular', "Don't Miss", 'By Day', 'Last Watched']
  response_feeds = @response.to_xml!.xpath('//Title').map { |match| match.text }
  response_feeds.should_not be_nil
  response_feeds.should match_array feeds
end

Then(/^the response should include the mobile app feeds$/) do
  feeds = ["A - Z", "CITV", "CRUCIAL CATCHUP", "EPISODE INFO", "ITV1", "ITV2", "ITV3",
           "ITV4", "MOST WATCHED", "PROGRAMME INFO", "PROGRAMMES BY DAY", "SEARCH"]
  response_feeds = @response.to_xml!.xpath('//Title').map { |match| match.text }
  response_feeds.should_not be_nil
  response_feeds.should match_array feeds
end

Then(/^the response should include the mobile app feeds excluding ITV1$/) do
  feeds = ["A - Z", "CITV", "CRUCIAL CATCHUP", "EPISODE INFO", "ITV2", "ITV3",
           "ITV4", "MOST WATCHED", "PROGRAMME INFO", "PROGRAMMES BY DAY", "SEARCH"]
  response_feeds = @response.to_xml!.xpath('//Title').map { |match| match.text }
  response_feeds.should_not be_nil
  response_feeds.should match_array feeds
end
