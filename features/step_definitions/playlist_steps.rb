Given /^I request the Mercury playlist with (\d+) and (\w+)$/ do |vodcrid, platform|
  puts EnvConfig['mercury_url']
  @response = @mercury_playlist.playlist_request vodcrid, platform
end

Then /^I get a successful response$/ do
  puts @response.to_xml

  puts @response.xpath("//ProductionId").text
  puts @response.xpath("//Vodcrid").text

end
