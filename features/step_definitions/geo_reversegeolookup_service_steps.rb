$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_api'

Before do
  @mercury_api = MercuryApi.new
  @response = ''
end

Given /^I request the reversegeolookup service with the following (-*\d+\.\d+) & (-*\d+\.\d+)$/ do |latitude, longitude|
  @original_uri = "#{ENV['mercury_url']}/api/geo/reversegeolookup/#{latitude}/#{longitude}"
  @response = @mercury_api.get_response_from_url @original_uri
end

Then /^I should get the correct (\w+) returned from the postcode service$/ do |broadcaster|
  json = @mercury_api.parse_json_response @response
  unless @mercury_api.value_exists_in_json_hash? json, broadcaster, "RegionInfo", "Broadcaster"
    raise "could not find the expected Boradcaster value: #{broadcaster} in the response for uri: #@uri"
  end
end

Then /^I expected the see the findregion value from the postcode service$/ do
  pending # express the regexp above with the code you wish you had
end
