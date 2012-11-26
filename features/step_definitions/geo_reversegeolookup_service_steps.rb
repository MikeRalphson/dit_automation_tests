Given /^I request the reversegeolookup service with the following (-*\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  @original_uri = "#{EnvConfig['mercury_url']}/api/geo/reversegeolookup/#{latitude}/#{longitude}"
  @response = open(@original_uri)
end

Given /^I request the reversegeolookup service from outside the UK with (-*\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  begin
    @original_uri = "#{EnvConfig['mercury_url']}/api/geo/reversegeolookup/#{latitude}/#{longitude}"
    @response = open(@original_uri)
  rescue OpenURI::HTTPError => error
    @error = error
  end
end

Given /^I request the geolookup for postcode service with the following (\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  begin
    @original_uri = "#{EnvConfig['mercury_url']}/api/geo/reversegeopostcodelookup/#{latitude}/#{longitude}"
    @response = open(@original_uri)
  rescue OpenURI::HTTPError => error
    @error = error
  end
end

Then /^I should get the correct (\w+) returned from the postcode service$/ do |broadcaster|
  json = @mercury_api.parse_json_response @response.read
  unless @mercury_api.value_exists_in_json_hash? json, broadcaster, "RegionInfo", "Broadcaster"
    raise "could not find the expected broadcaster value: #{broadcaster} in the response for uri: #@uri"
  end
end

Then /^I expect to see a 500 Internal Server Error$/ do
  @error.io.status[0].should == '500'
end

Then /^I should not get a 302 redirect to the postcode service$/ do
  @response.status[0].should == '200'
end

Then /^I should get the correct (.*) returned from the geolookup postcode service$/ do |postcode|
  json = @mercury_api.parse_json_response(@response.read)
  @mercury_api.value_exists_in_json_hash? json, postcode, "Postcode"
end

Then /^the response should contain the "(.*)" header$/ do |header|
  @response.meta[header.downcase].should == '*'
end

