# encoding: utf-8
require 'rspec/expectations';
require 'set'
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury'

Before do
  @mercury = Mercury.new
end

Given /^I request the mrss (.*) api$/ do |uri|
  @uri = "#{ENV['ENVIRONMENT']}#{uri}"
  puts @uri
end

Given /^I request the (.*) (.*) (.*) api$/ do |type, platform, uri|
  @uri = "#{ENV['ENVIRONMENT']}/api/#{type}/#{platform}/#{uri}"
  @response = @mercury.get_response_from_url @uri
  puts 'EoS'
end

Then /^I get a successful (.*) response with the correct (.*)$/ do |type, platform|
  case type
    when 'xml'
      xml = @mercury.get_xml_from_response @response
      if @mercury.value_exists_in_xml_node? xml, "Value", platform
        @platform_node = platform
      else
        raise "could not find the correct platform value: #{platform} in the response for uri: #@uri"
      end
    when 'json'
      json = @mercury.parse_json_response @response
      if @mercury.value_exists_in_json_hash? json, platform, "Parameters", "Platform"
        @platform_node = platform
      else
        raise "could not find the correct platform value: #{platform} in the response for uri: #@uri"
      end
    when 'mhegdata'
      if @mercury.value_exists_in_mhegdata? @response, @uri
        @platform_node = platform
      else
        raise "could not find the correct platform value: #{platform} in the response for uri: #@uri"
      end
    else
      raise ArgumentError.new('invalid API request type')
  end
  @platform_node.should match(%r{#{platform}}) # case insensitive
  @response = ''
end

Then /^the response should contain production id (.*)$/ do |production_id|
  xml = @mercury.get_xml_from_response @response
  unless @mercury.value_exists_in_xml_node?(xml, "ProductionId", production_id)
    raise 'invalid content found in response'
  end
end

Then /^the response should contain entries for each of the last 7 days$/ do
  xml = @mercury.get_xml_from_response @response
  expected_week = @mercury.calculate_week
  actual_week = @mercury.get_values_from_xml xml, "Title"
  difference = (expected_week.to_set ^ actual_week.to_set)
  difference.size.should == 0
end

