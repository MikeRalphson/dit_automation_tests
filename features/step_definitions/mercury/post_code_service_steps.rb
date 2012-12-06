Given /^I request the postcode service with the following (.+)$/ do |postcode|
  @client = HttpClient.new.get(URI.parse("#{EnvConfig['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/, "")}"))
end

Then /^I should get the correct (\w+) returned$/ do |broadcaster|
  begin
    json = @mercury_api.parse_json_response @client.response
    unless @mercury_api.value_exists_in_json_hash? json, broadcaster, "RegionInfo", "Broadcaster"
      raise "could not find the expected broadcaster value: #{broadcaster} in the response for uri: #@uri"
    end
  rescue
    raise "there was a problem parsing the json response: #{json}"
  end
end

Then /^I should get a not found error$/ do
  json = @mercury_api.parse_json_response @client.response
  unless @mercury_api.value_exists_in_json_hash? json, "NotFound", "Error", "Type"
    raise "incorrect error message returned: #{json}"
  end
end

Then /^I should get an invalid format error$/ do
  json = @mercury_api.parse_json_response @client.response
  unless @mercury_api.value_exists_in_json_hash? json, "InvalidFormat", "Error", "Type"
    raise "incorrect error message returned: #{json}"
  end
end

# This method Then /^the response should contain the "(.*)" header$/ is found under 
# Geo_reversegeolookup_steps.rb

