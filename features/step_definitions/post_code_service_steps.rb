Given /^I request the postcode service with the following (.+)$/ do |postcode|
  @uri = URI.parse("#{EnvConfig['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/, "")}")
  @response = @mercury_api.get_response_from_url @uri
end

Then /^I should get the correct (\w+) returned$/ do |broadcaster|
  begin
    json = @mercury_api.parse_json_response @response
    unless @mercury_api.value_exists_in_json_hash? json, broadcaster, "RegionInfo", "Broadcaster"
      raise "could not find the expected broadcaster value: #{broadcaster} in the response for uri: #@uri"
    end
  rescue
    raise "there was a problem parsing the json response: #{json}"
  end
end

Then /^I should get a not found error$/ do
  json = @mercury_api.parse_json_response @response
  unless @mercury_api.value_exists_in_json_hash? json, "NotFound", "Error", "Type"
    raise "incorrect error message returned: #{json}"
  end
end

Then /^I should get an invalid format error$/ do
  json = @mercury_api.parse_json_response @response
  unless @mercury_api.value_exists_in_json_hash? json, "InvalidFormat", "Error", "Type"
    raise "incorrect error message returned: #{json}"
  end
end
