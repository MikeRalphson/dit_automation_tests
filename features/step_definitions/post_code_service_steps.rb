$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_api'

Before do
  @mercury_api = MercuryApi.new
  @response = ''
end

Given /^I request the postcode service with the following (.+)$/ do |postcode|
  @uri = URI.parse("#{ENV['mercury_url']}/api/json/postcode/#{postcode.gsub(/\s+/,"")}")
  @response = @mercury_api.get_response_from_url @uri
end

Then /^I should get the correct (\w+) returned$/ do |broadcaster|
  json = @mercury_api.parse_json_response @response
  unless @mercury_api.value_exists_in_json_hash? json, broadcaster, "RegionInfo", "Broadcaster"
    raise "could not find the expected broadcaster value: #{broadcaster} in the response for uri: #@uri"
  end
end
