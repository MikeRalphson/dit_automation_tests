Given /^I request the Mercury playlist with (\d+) and (\w+)$/ do |vodcrid, platform|
  @mercury_playlist.create_client
  case platform
    when "Mobile"
      @response = @mercury_playlist.mobile_playlist_request vodcrid, platform
    else
      @response = @mercury_playlist.playlist_request vodcrid, platform
  end
end

Given /^I request the Mercury playlist from (.*) with (.*) and (.*)$/ do |location, vodcrid, platform|
  @mercury_playlist.create_client_with_location location
  begin
    case platform
      when "Mobile"
        @response = @mercury_playlist.mobile_playlist_request vodcrid, platform
      else
        @response = @mercury_playlist.playlist_request vodcrid, platform
    end
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Then /^I get the correct bitrate based on the (.*)$/ do |platform|
  found_bitrates = @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile")
  found_bitrates = found_bitrates.map { |node| node.attr("bitrate").to_i }

  case platform
    when "android"
      expected_bitrates = [150000, 300000, 400000, 600000, 800000, 1200000]
    when "Samsung"
      expected_bitrates = [1200000]
    when "YouView"
      expected_bitrates = [1200000]
    when "PS3"
      expected_bitrates = [800000]
    when "Mobile"
      expected_bitrates = [400000]
    else
      expected_bitrates = [400000, 600000, 800000, 1200000]
  end

  comparison = (found_bitrates.to_set ^ expected_bitrates.to_set)
  raise "found bitrates: #{found_bitrates} did not match: #{expected_bitrates}" unless comparison.size == 0
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
    when "YouView"
      base_urls.each { |url| url.attr("base").should == nil }
    else
      base_urls.each { |url| url.attr("base").should match(/\Artmpe/) }
  end
end

Then /^I get the expected (.*) status$/ do |response|
  @playlist_error.to_s.should match /InvalidGeoRegion/ if response == "blocked"
  @playlist_error.to_s.should_not match /InvalidGeoRegion/ if response == "success"
end

Then /^the advert URI's should contain the correct size$/ do
  @advert_uris ||= @response.xpath("//Action/URL")
  @advert_uris.each do |uri|
    (uri.to_s.match 'size=\w+').to_s.should == "size=itvplayer"
  end
end

Then /^the advert URI's should contain the correct area$/ do
  @advert_uris ||= @response.xpath("//Action/URL")
  @advert_uris.each do |uri|
    (uri.to_s.match 'area=\w+').to_s.should == "area=itvplayer"
  end
end

Then /^the advert URI's should contain the correct site based on the (.*)$/ do |platform|
  @advert_uris ||= @response.xpath("//Action/URL")
  @advert_uris.each do |uri|
    if platform == "DotCom"
      (uri.to_s.match 'site=\w+\.*\w*').to_s.should == "site=itv"
    else
      (uri.to_s.match 'site=\w+\.*\w*').to_s.should == "site=itv.#{platform.downcase}"
    end
  end
end

Then /^I get the correct video type based on the (.*)$/ do |platform|
  video_type = @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile/URL")

  case platform
    when "YouView"
      video_type.each { |url| (url.text.should match(/\.ts$/)) && (url.text.should match(/\Ahttp/)) }
    else
      video_type.each { |url| url.text.should match(/\.mp4$/) }
  end
end

