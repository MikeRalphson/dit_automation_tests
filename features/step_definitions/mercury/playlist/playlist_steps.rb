Given /^I have a piece of (\w+) catchup content$/ do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new
end

Given /^I have a piece of (\w+) archive content$/ do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new('archive')
end

Given(/^stream type HLS is not requested$/) do
  @platform.params[:StreamType] = 'RTMPE'
end

When /^I request the Mercury playlist$/ do
  begin
    @platform.request_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
    # consider building error logging into the Mercury playlist module
  end
end

When /^I request the Mercury playlist from (\d+\.\d+\.\d+\.\d+)$/ do |location|
  begin
    @platform.playlist_request.use_insecure_mercury_url = true
    @platform.playlist_request.location = location
    @platform.request_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^I get the correct base url$/ do
  base_urls = @platform.playlist_response.base_urls
  base_urls.should_not be_empty
  base_urls.each { |url| url.attr('base').should =~ @platform.base_url unless @platform.base_url.nil?} # hacky for YV?
end

When /^I get the correct video type$/ do
  video_type = @platform.playlist_response.video_type
  video_type.should_not be_empty
  video_type.each { |url| url.text.should match @platform.video_type unless @platform.video_type.nil? } # Hack for NowTV until Mercury is removed
end

Then /^I get the correct production$/ do
  raise @playlist_error if @playlist_error
  @platform.playlist_response.production.should match @platform.production
end

Then /^the expiry date is in the future$/ do
  todays_date = Date.today.strftime('%FT%T')
  expiry_date = @platform.playlist_response.expiry_date
  (todays_date > expiry_date).should == false
end

Then /^I get the correct bitrates$/ do
  @platform.playlist_response.bitrates.should == @platform.bitrates
end

Then /^I get a (.*) response$/ do |status|
  if status == 'blocked'
    @playlist_error.to_s.should match /InvalidGeoRegion/
  else
    @platform.playlist_response.production.should match @platform.production
  end
end

Then /^the advert URIs should exist$/ do
  @adverts ||= @platform.playlist_response.adverts
  @adverts.should_not be_empty
end

Then /^the advert URIs should contain the 'size' tag with the default size$/ do
  @adverts ||= @platform.playlist_response.adverts
  @adverts.each do |content_break|
    content_break.each do |advert|
      advert.match(/size=(\w+)/).captures.to_s.should =~ @platform.advert_size
    end
  end
end

Then /^the advert URIs should contain the 'area' tag with the correct area$/ do
  @adverts ||= @platform.playlist_response.adverts
  @adverts.each do |content_break|
    content_break.each do |advert|
      advert.match(/area=(\w+\.*\w*)/).captures.to_s.should =~ @platform.advert_area
    end
  end
end

Then /^the advert URIs should contain the 'site' tag with the correct site$/ do
  @adverts ||= @platform.playlist_response.adverts
  @adverts.each do |content_break|
    content_break.each do |advert|
      advert.match(/site=(\w+\.*\w*)/).captures.to_s.should =~ @platform.advert_site
    end
  end
end

# N.B. we need the unused parameters to avoid identical step defintions and maintain behaviour clarity
Then /^I get a single (.*) sting with a bitrate of (\d+)$/ do |video_type, bitrate|
  stings = @platform.playlist_response.stings
  stings.should_not be_empty
  stings.size.should == 1
  stings.each do |sting|
    sting.should_not be_empty
    sting.should match @platform.sting_video_type
  end

  @platform.playlist_response.sting_bitrates.should match_array @platform.sting_bitrates
end

Then /^I get two .mp4 stings with bitrates of 300 and 600$/ do
  stings = @platform.playlist_response.stings
  stings.should_not be_empty
  stings.size.should == 2
  stings.each do |sting|
    sting.should_not be_empty
    sting.should match @platform.sting_video_type
  end

  @platform.playlist_response.sting_bitrates.should match_array @platform.sting_bitrates
end

Then /^there should not be a Session ID in the response$/ do
  @platform.playlist_response.session_id.should be_empty
end

Then /^there should be a Session ID in the response$/ do
  @platform.playlist_response.session_id.should match /\A\w+\Z/
end

Then /^there should be a Session ID of (\d+) in the response$/ do |session_id|
  @platform.playlist_response.session_id.should match /\A#{session_id}\Z/
end

Then /^there should be a valid Session ID in the response$/ do
  session_id = @platform.playlist_response.session_id
  session_id.should_not be_empty
  session_id.should_not match /\A0\Z/
end

Then /^the advert URIs should contain the 'generic' tag with same GUID for each URI$/ do
  guids = @platform.playlist_response.playlist_guids
  guids.flatten.uniq.count.should == 1
end

Then(/^the advert URIs should contain the 'pv' tag with the correct player version$/) do
  player_version = @platform.playlist_response.player_version.flatten
  player_version.each_with_index do |value, index|
    index % 2 == 0 ? value.should =~ /pv/ : value.should =~ /itvplayer.13.2.2/
  end
end

Then(/^the advert URIs should contain the 'prodid' tag with the correct production ID$/) do
  map = {'/' => '_', '#' => '-'}
  regex = Regexp.union(map.keys)

  production = @platform.production.prepend('itv.')
  sanitised_production = production.gsub(regex, map)

  advert_production_ids = @platform.playlist_response.production_id.flatten
  advert_production_ids.each { |id| id.should == sanitised_production }
end

Then(/^the advert URIs should contain the 'tparts' tag with the correct number of programme parts$/) do
  programme_parts = @platform.playlist_response.programme_parts.flatten
  programme_parts.each { |part_count| part_count.should =~ /4/ } # we typically ingest with 4 programme parts
end

Then(/^the advert URIs should contain the 'owner' tag with a placeholder value$/) do
  owner = @platform.playlist_response.owner.flatten
  owner.each { |value| value.should =~ /x/ }
end

Then(/^the advert URIs should contain the 'series' tag with the correct series$/) do
  series = @platform.playlist_response.series.flatten
  series.each { |value| value.should =~ /\w{1,10}#{@platform.series}/ }
end

Then(/^I get the correct CDN video URL's$/) do
  expected_values = ['i01-youview.content.itv.com', 'csp150-002.cdd.bt.net', 'ttyouview.content.itv.com']
  @platform.playlist_response.video_type.each_with_index do |media_file, index|
    media_file.text.should include expected_values[index]
  end
end

Then(/^I get the correct ID attributes for each CDN$/) do
  expected_values = ['AKAMAI_BBTS-H.264-MAIN', 'COM.BT.ITVTRIAL_BBTS-H.264-MAIN', 'COM.TALKTALKGROUP_BBTS-H.264-MAIN']
  result = @platform.playlist_response.ids
  result.should == expected_values
end

Then(/^there should be an unauthorised message$/) do
  access = @platform.playlist_response.check_unauthorised_access
  access.should include 'Unauthorized access'
end

Then(/^I should get a valid csmil returned in the response$/) do
  @platform.playlist_response.stream_channels.to_s.should include ".csmil"
end
