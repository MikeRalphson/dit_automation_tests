Given /^I request the reversegeolookup service with (-*\d+\.\d+) & (-*\d+\.\d+)$/ do |lat, long|
  puts url = "#{EnvConfig['mercury_url']}/api/geo/reversegeolookup/#{lat}/#{long}"
  @client = HttpClient.new.get(url)
end

Given /^I request the geolookup for postcode service with the following (\d+\.\d+) & (-*\d+\.\d+)$/ do |lat, long|
  puts url = "#{EnvConfig['mercury_url']}/api/geo/reversegeopostcodelookup/#{lat}/#{long}"
  @client = HttpClient.new.get(url)
end

Then /^I should receive the correct (\w+) from the postcode service$/ do |broadcaster|
  json = @client.response.to_json
  puts "Response JSON: #{json}"
  json['RegionInfo']['Broadcaster'].should == broadcaster
end

Then /^I should receive the correct (.*) from the geolookup postcode service$/ do |postcode|
  json = @client.response.to_json
  puts "Response JSON: #{json}"
  json['Postcode'].should == postcode
end

Then /^the response should contain the "(.*)" header$/ do |header|
  @client.response_header(header).should == '*'
end

Then /^I should not receive a 302 redirect to the postcode service$/ do
  @client.status.should == '200'
end
