Given /^I request the Mercury playlist for (.*) with a specific (.*)$/ do |platform, channel|
  @vodcrid_helpers.set_production_from_config(platform, channel)
  if platform =~ /freesat/i
    @uri = "#{EnvConfig['mercury_url']}/api/mhegdata/freesat/playlist/#{@vodcrid_helpers.production}?t=playlistscreentoken"
    @response = open(@uri).read
  else
    @playlist_client = @mercury_playlist_class.create_client
    @response = @mercury_playlist_class.playlist_request_for_platform(@playlist_client, @vodcrid_helpers.production, platform)
  end
end

Then /^I should receive a playlist with an ITV1 DOG$/ do
  @response.xpath('//Dog').text.should match /ITV1\.png$/
end

Then /^I should receive a playlist with a DOG matching the (.*)$/ do |channel|
  if channel =~ /\Aitv/i
    @response.xpath('//Dog').text.should match /#{channel.upcase}\.png$/
  else
    @response.xpath('//Dog').text.should match /ITVplc\.png$/
  end
end

Then /^I should receive a FreeSat response with a DOG matching the (.*)$/ do |channel|
  @response.match(/\w+.png/)[0].should match /\A#{channel.upcase}_GREY_BG\.png/
end
