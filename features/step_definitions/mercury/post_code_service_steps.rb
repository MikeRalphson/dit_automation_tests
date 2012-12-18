Given /^I request the postcode service with the following (.+)$/ do |postcode|
  @client = HttpClient.new.get(URI.parse("#{EnvConfig['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/, "")}"))
end

Given /^I request the postcode service with a partial (.+)$/ do |postcode|
  @client = HttpClient.new.get(URI.parse("#{EnvConfig['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/, "")}"))
end

Then /^I should get the correct (\w+) returned$/ do |broadcaster|
  json = @mercury_api.parse_json_response @client.response
  @mercury_api.find_value_in_hash("Broadcaster", json).should == broadcaster
end

Then /^I should get a not found error$/ do
  json = @mercury_api.parse_json_response @client.response
  @mercury_api.find_value_in_hash("Type", json).should == "NotFound"
end

Then /^I should get an invalid format error$/ do
  json = @mercury_api.parse_json_response @client.response
  @mercury_api.find_value_in_hash("Type", json).should == "InvalidFormat"
end

# This method Then /^the response should contain the "(.*)" header$/ is found under
# reversegeolookup_service_steps.rb
