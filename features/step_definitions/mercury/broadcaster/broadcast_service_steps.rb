Given /^I request the master feed for (\w+) and (\w+) with (\w+)$/ do |broadcaster, platform, screen_size|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?screensize=#{screen_size}&broadcaster=#{broadcaster}"
  @response = open(@uri).read
end

Given /^I request the master feed for (\w+) and (\w+)$/ do |platform, broadcaster|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?broadcaster=#{broadcaster}"
  @response = open(@uri).read
end

Then /^the response should include the feed (.*)$/ do |title|
  xml = @response.to_xml!
  raise 'invalid content found in response' unless @mercury_api.value_exists_in_xml_node?(xml, 'Title', title)
end

Then /^the response should not include the ITV1 feed$/ do
  feeds = @response.to_xml!.xpath('//Title').map { |match| match.text }
  feeds.should_not be_nil
  feeds.should_not include('ITV1')
end

Then(/^the response should include all the feeds$/) do
  feeds = ['ITV1', 'ITV2', 'ITV3', 'ITV4', 'CITV', 'A - Z', 'Most Popular', "Don't Miss", 'By Day', 'Last Watched']
  response_feeds = @response.to_xml!.xpath('//Title').map { |match| match.text }
  response_feeds.should_not be_nil
  response_feeds.should match_array feeds
end
