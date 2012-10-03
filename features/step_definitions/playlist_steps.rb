Given /^I request the Mercury playlist with (\d+) and (\w+)$/ do |vodcrid, platform|
  @playlist_client = @mercury_playlist.create_client
  begin
    case platform
      when /mobile/i
        @response = @mercury_playlist.mobile_playlist_request(@playlist_client, vodcrid, platform)
      else
        @response = @mercury_playlist.playlist_request(@playlist_client, vodcrid, platform)
    end
  rescue Savon::SOAP::Fault => error
    raise "#{error.message}. \nPerhaps the request has changed or the service is down?"
  end
end

Given /^I request the Mercury playlist from (.*) with (.*) and (.*)$/ do |location, vodcrid, platform|
  @playlist_client = @mercury_playlist.create_client_with_location location
  begin
    case platform
      when /mobile/i
        @response = @mercury_playlist.mobile_playlist_request(@playlist_client, vodcrid, platform)
      else
        @response = @mercury_playlist.playlist_request(@playlist_client, vodcrid, platform)
    end
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Given /^I request a (\w+) Mercury playlist with (\d+)$/ do |platform, vodcrid|
  @mercury_playlist.create_client
  @uri = "#{EnvConfig['mercury_url']}/api/mhegdata/#{platform}/playlist/#{vodcrid}?t=playlistscreentoken"
  @response = @mercury_api.get_response_from_url @uri
end

Then /^I get the correct bitrate based on the (.*)$/ do |platform|
  found_bitrates = @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile")
  found_bitrates = found_bitrates.map { |node| node.attr("bitrate").to_i }

  case platform
    when /android/i
      expected_bitrates = [150000, 300000, 400000, 600000, 800000, 1200000]
    when /samsung/i
      expected_bitrates = [1200000]
    when /youview/i
      expected_bitrates = [1200000]
    when /ps3/i
      expected_bitrates = [800000]
    when /mobile/i
      expected_bitrates = [400000]
    else
      expected_bitrates = [400000, 600000, 800000, 1200000]
  end

  comparison = (found_bitrates.to_set ^ expected_bitrates.to_set)
  raise "found bitrates: #{found_bitrates} did not match: #{expected_bitrates}" unless comparison.size == 0
end

Then /^I get the correct ManifestFile url based on the (.*)$/ do |platfrom|
  manifest_url = @response.xpath("//VideoEntries/Video/ManifestFile/URL").to_s
  manifest_url.should =~ /manifest.f4m/
end

Then /^I get the requested (\d+)$/ do |vodcrid|
  response_vodcrid = @response.xpath("//Vodcrid").text.match(/\d+$/).to_s
  response_vodcrid.should match vodcrid
end

Then /^the expiry date is in the future$/ do
  todays_date = Date.today.strftime("%FT%T")
  expiry_date = DateTime.parse(@response.xpath("//ExpiryDate").text).strftime("%FT%T")
  (todays_date > expiry_date).should == false
end

Then /^I get the correct base url based on the (.+)$/ do |platform|
  base_urls = @response.xpath("//VideoEntries/Video/MediaFiles")
  base_urls.should_not be_empty

  case platform
    when /youview/i
      base_urls.each { |url| url.attr("base").should == nil }
    else
      base_urls.each { |url| url.attr("base").should match(/\Artmpe/) }
  end
end

Then /^I get the expected (.*) status for that (.*)$/ do |response, vodcrid|
  if @playlist_error
    raise "#{@playlist_error.message}. \nPerhaps the request has changed or the service is down?" unless @playlist_error.to_s.match /InvalidGeoRegion/
  end
  @playlist_error.to_s.should match /InvalidGeoRegion/ if response == "blocked"
  @response.xpath("//Vodcrid").text.should match vodcrid if response == "success"
end

Then /^the advert URI should contain the correct size$/ do
  @advert_uris ||= @response.xpath("//Action/URL")
  @advert_uris.each do |uri|
    (uri.to_s.match 'size=\w+').to_s.should == "size=itvplayer"
  end
end

Then /^the advert URI should contain the correct area$/ do
  @advert_uris ||= @response.xpath("//Action/URL")
  @advert_uris.each do |uri|
    (uri.to_s.match 'area=\w+').to_s.should == "area=itvplayer"
  end
end

Then /^the advert URI should contain the correct site based on the (.*)$/ do |platform|
  @advert_uris ||= @response.xpath("//Action/URL")
  @advert_uris.each do |uri|
  case platform
    when /dotcom/i
      (uri.to_s.match 'site=\w+\.*\w*').to_s.should == "site=itv"
    when /android/i
      (uri.to_s.match 'site=\w+\.*\w*').to_s.should == "site=itv.mobile"
    else 
      (uri.to_s.match 'site=\w+\.*\w*').to_s.should == "site=itv.#{platform.downcase}"
    end
  end
end

Then /^I get the correct video type based on the (.*)$/ do |platform|
  video_type = @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile/URL")
  raise 'no matching values found in the response' unless video_type
  case platform
    when /youview/i
      video_type.each { |url| (url.text.should match(/\.ts$/)) && (url.text.should match(/\Ahttp/)) }
    else
      video_type.each { |url| url.text.should match(/\.mp4$/) }
  end
end

Then /^I get the requested vodcrid in the response (\d+)$/ do |vodcrid|
  unless @mercury_api.value_exists_in_mhegdata? @response, /\/api\/mhegdata\/Freesat\/AuthorizeContent\/#{vodcrid}\/\d{3}\?t=playlistscreentoken/
    raise 'AuthorizeContent url not found from your request' 
  end
end

Then /^the advert URI should contain the correct (.*) and (.*)$/ do |size, site|
  unless @mercury_api.value_exists_in_mhegdata? @response, ("size=#{size}\/.*\/site=#{site}\/")
    raise 'Size and Site values are not found in the Advert url from your request' 
  end
end
