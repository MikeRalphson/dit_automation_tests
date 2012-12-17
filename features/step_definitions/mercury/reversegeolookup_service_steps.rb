Given /^I request the reversegeolookup service with the following (-*\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  @client = HttpClient.new.get("#{EnvConfig['mercury_url']}/api/geo/reversegeolookup/#{latitude}/#{longitude}")
end

Given /^I request the reversegeolookup service from outside the UK with (-*\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  @client = HttpClient.new.get("#{EnvConfig['mercury_url']}/api/geo/reversegeolookup/#{latitude}/#{longitude}")
end

Given /^I request the geolookup for postcode service with the following (\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  @client = HttpClient.new.get("#{EnvConfig['mercury_url']}/api/geo/reversegeopostcodelookup/#{latitude}/#{longitude}")
end

Then /^I should get the correct (\w+) returned from the postcode service$/ do |broadcaster|
  json = @mercury_api.parse_json_response @client.response
  @mercury_api.find_value_in_hash("Broadcaster", json).should == broadcaster
end

Then /^I expect to see a 500 Internal Server Error$/ do
  @client.status.should == '500'
end

Then /^I should not get a 302 redirect to the postcode service$/ do
  @client.status.should == '200'
end

Then /^I should get the correct (.*) returned from the geolookup postcode service$/ do |postcode|
  json = @mercury_api.parse_json_response @client.response
  @mercury_api.find_value_in_hash("Postcode", json).should == postcode
end

Then /^the response should contain the "(.*)" header$/ do |header|
  @client.response_header(header).should == '*'
end
