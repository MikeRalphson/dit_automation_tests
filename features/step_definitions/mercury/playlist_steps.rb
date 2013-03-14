Given /^I have a piece of (.*) catchup content$/ do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new
end

Given /^I have a piece of (.*) archive content$/ do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new('archive')
end

When /^I request the Mercury playlist$/ do
  begin
    @response = @platform.mercury_request
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
    # consider building error logging into the Mercury playlist module
  end
end

When /^I request the Mercury playlist from (\d+\.\d+\.\d+\.\d+)$/ do |location|
  begin
    @response = @platform.mercury_request(location)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^I get the correct base url$/ do
  base_urls = @platform.get_base_urls_from_response(@response)
  base_urls.should_not be_empty
  base_urls.each { |url| url.attr("base").should =~ @platform.base_url unless @platform.base_url.nil? } # hacky for YV?
  # try empty string instead of nil
end

When /^I get the correct video type$/ do
  video_type = @platform.get_video_type_from_response(@response)
  video_type.should_not be_empty
  video_type.each { |url| url.text.should match @platform.video_type }
end

Then /^I get the correct production$/ do
  raise @playlist_error if @playlist_error
  @platform.get_production_from_response(@response).should match @platform.production
end

Then /^the expiry date is in the future$/ do
  todays_date = Date.today.strftime("%FT%T")
  expiry_date = @platform.get_expiry_date_from_response(@response)
  (todays_date > expiry_date).should == false
end

Then /^I get the correct bitrates$/ do
  @platform.get_bitrates_from_response(@response).should == @platform.bitrates
end

Then /^I get a (.*) response$/ do |status|
  if status == 'blocked'
    @playlist_error.to_s.should match /InvalidGeoRegion/
  else
    @platform.get_production_from_response(@response).should match @platform.production
  end
end

Then /^the advert URI's should exist$/ do
  @advert_uris ||= @platform.get_adverts_from_response(@response)
  @advert_uris.should_not be_nil
end

Then /^the advert URI's should contain the default size$/ do
  @advert_uris ||= @platform.get_adverts_from_response(@response)
  @advert_uris.each { |uri| uri.match(/size=(\w+)/).captures.to_s.should =~ @platform.advert_size }
end

Then /^the advert URI's should contain the correct area$/ do
  @advert_uris ||= @platform.get_adverts_from_response(@response)
  @advert_uris.each { |uri| uri.match(/area=(\w+\.*\w*)/).captures.to_s.should =~ @platform.advert_area }
end

Then /^the advert URI's should contain the correct site$/ do
  @advert_uris ||= @platform.get_adverts_from_response(@response)
  @advert_uris.each { |uri| uri.match(/site=(\w+\.*\w*)/).captures.to_s.should =~ @platform.advert_site }
end

# N.B. we need the unused parameters to avoid identical step defintions and maintain behaviour clarity
Then /^I get a single (.*) sting with a bitrate of (\d+)$/ do |video_type, bitrate|
  stings = @platform.get_stings_from_response(@response)
  stings.should_not be_empty
  stings.size.should == 1
  stings.each do |sting|
    sting.should_not be_empty
    sting.should match @platform.sting_video_type
  end

  @platform.get_sting_bitrates_from_response(@response).should match_array @platform.sting_bitrates
end

Then /^I get two .mp4 stings with bitrates of 300 and 600$/ do
  stings = @platform.get_stings_from_response(@response)
  stings.should_not be_empty
  stings.size.should == 2
  stings.each do |sting|
    sting.should_not be_empty
    sting.should match @platform.sting_video_type
  end

  @platform.get_sting_bitrates_from_response(@response).should match_array @platform.sting_bitrates
end

Then /^there should not be a Session ID in the response$/ do
  @platform.get_session_id_from_response(@response).should be_empty
end

Then /^there should be a Session ID in the response$/ do
  @platform.get_session_id_from_response(@response).should match /\A\w+\Z/
end

Then /^there should be a Session ID of (\d+) in the response$/ do |session_id|
  @platform.get_session_id_from_response(@response).should match /\A#{session_id}\Z/
end

Then /^there should be a valid Session ID in the response$/ do
  session_id = @platform.get_session_id_from_response(@response)
  session_id.should_not be_empty
  session_id.should_not match /\A0\Z/
end
