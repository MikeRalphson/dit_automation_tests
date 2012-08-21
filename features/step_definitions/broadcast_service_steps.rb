$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_api'
require 'env_config'

Before do
  @mercury_broadcaster = MercuryApi.new
  @response = ''
end

Given /^I request the content for (\w+) and (\w+) with (\w+)$/ do |broadcaster, platform, screen_size|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?screensize=#{screen_size}&broadcaster=#{broadcaster}"
  @response = @mercury_broadcaster.get_response_from_url @uri
end

Given /^I request the content for (\w+) and (\w+)$/ do |broadcaster, platform|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?broadcaster=#{broadcaster}"
  @response = @mercury_broadcaster.get_response_from_url @uri
end

Then /^the response should contain channel (.*)$/ do |content|
  xml = @mercury_broadcaster.get_xml_from_response @response
  unless @mercury_broadcaster.value_exists_in_xml_node?(xml, "Title", content)
    raise 'invalid content found in response'
  end
end

Then /^the response should not contain (.*)$/ do |content|
  xml = @mercury_broadcaster.get_xml_from_response @response
  if @mercury_broadcaster.value_exists_in_xml_node?(xml, "Title", content)
    raise 'invalid content found in response'
  end
end
