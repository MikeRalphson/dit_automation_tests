$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_api'
require 'env_config'

Before do
  @mercury_api = MercuryApi.new
  @response = ''
end

Given /^I request the postcode service with the following (.*)$/ do |postcode, broadcaster|
  @uri = "#{EnvConfig['mercury_url']}#{uri}"
  @response = @mercury_api.get_response_from_url @uri
end

Then /^I should get the correct <broadcaster> returned$/ do
	pending #wd
end

