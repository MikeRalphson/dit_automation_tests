Given /^I request the postcode service with (.*)$/ do |postcode|
  @client = HttpClient.new.get(URI.parse("#{EnvConfig['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/, '')}"))
end

Given /^I request the postcode service using a partial (.*)$/ do |postcode|
  @client = HttpClient.new.get(URI.parse("#{EnvConfig['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/, '')}"))
end

Then /^I should receive the correct (\w+)$/ do |broadcaster|
  @client.response.to_json['RegionInfo']['Broadcaster'].should == broadcaster
end

Then /^I should receive a not found error$/ do
  @client.response.to_json['Error']['Type'].should == 'NotFound'
end

Then /^I should get an invalid format error$/ do
  @client.response.to_json['Error']['Type'].should == 'InvalidFormat'
end

# This method Then /^the response should contain the "(.*)" header$/ is found under
# reversegeolookup_service_steps.rb
