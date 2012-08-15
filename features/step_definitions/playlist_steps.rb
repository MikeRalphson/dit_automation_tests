# encoding: utf-8
require 'cucumber/formatter/unicode'
require 'nokogiri'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_playlist'

Before do
  @mercury_playlist = MercuryPlaylist.new
  @response = ''
end

Given /^I request the Mercury playlist with (.+) (\d+) and (\w+)$/ do |guid, vodcrid, platform|
  @response = @mercury_playlist.playlist_request guid, vodcrid, platform
end

Then /^I get a successful response$/ do
  puts @response.to_xml

  puts @response.xpath("//ProductionId").text
  puts @response.xpath("//Vodcrid").text

end
