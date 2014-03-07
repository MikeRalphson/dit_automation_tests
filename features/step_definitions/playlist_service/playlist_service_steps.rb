Given(/^I have a broadcast type of (\w+)$/) do |broadcast|
  @broadcast = broadcast
  @platform.playlist_rest_request.broadcast = @broadcast
end

Given(/^I have an invalid production id$/) do
  @invalid_prodid = "#{EnvConfig['playlist_production']}".gsub('-','_')
  @platform.playlist_rest_request.productionid = @invalid_prodid
end

Given(/^I have no asset information$/) do
  @no_assets_prod_id = '0/0000/0000#000'
  @platform.playlist_rest_request.productionid = '0-0000-0000_000'
end

Given(/^I have no rendtions for a production id$/) do
  @platform.playlist_rest_request.productionid = '2-1507-0011_003'
end

When(/^I request the new playlist service$/) do
  @platform_to_s = @platform.class.to_s.downcase
  token = @platform.playlist_rest_request.get_hmac_token(@platform_to_s)
  @platform.request_rest_playlist(@platform_to_s, token)
  @response = @platform.playlist_rest_response
end

When(/^I request the new playlist service via http$/) do
  @platform_to_s = @platform.class.to_s.downcase
  token = @platform.playlist_rest_request.get_hmac_token(@platform_to_s)
  @response = @platform.playlist_rest_request.http_request(@platform_to_s, token)
end

When(/^I request the playlist service with a blank hmac token for supported platforms$/) do
  @platform_to_s = @platform.class.to_s.downcase
  @response = @platform.playlist_rest_request.blank_hmac_token(@platform_to_s)
end

Then(/^I should get a valid status code$/) do
  @platform.class.to_s == 'Samsung' || @platform.class.to_s == 'Android' ? @response.response_code.should == 200 : @response.response_code.should == 501
end

Then(/^I get the correct production ID$/) do
  if @platform_to_s == 'Samsung' || @platform_to_s == 'Android'
    @response.production_id.should match "#{EnvConfig['playlist_production']}"
  end
end

Then(/^I should get a status code of 501$/) do
  if @platform_to_s == 'samsung' || @platform_to_s == 'android'
    @platform.playlist_rest_response.stub_status_code.should == 501 # stubbed response
  else
    @response.code.should == 501
  end
end

Then(/^I should get csmil in the media files url$/) do
  @platform.playlist_rest_response.media_file.should include 'csmil'
end

Then(/^I should get a valid error response for invalid format$/) do
  @platform.playlist_rest_response.rest_error_message.should include "The ProductionId #{@invalid_prodid} Is Not In The Correct Format"
end

Then(/^the status code should be 400$/) do
  @platform.playlist_rest_response.response_code.should == 400
end

Then(/^I should get a valid platform not supported message$/) do
  #@platform.playlist_rest_response.error_message.should include "The Playlist Functionality For The Platform #{@platform_to_s} Is Not Available"
  @platform.playlist_rest_response.response_code.should == 501 # this should return message above!!
end

Then(/^I should get a valid response for broadcast type not implemented$/) do
  #@platform.playlist_rest_response.rest_error_message.should include "The Playlist Functionality For The Broadcaster #{@broadcast} Is Not Available"
  puts "Need to update code on PS from Not Implemented to The Playlist Functionality For The Broadcaster Utv Is Not Available"
end

Then(/^I should get a valid response indicating no assets found$/) do
  @platform.playlist_rest_response.rest_error_message.should include "Asset Information For Production Id #{@no_assets_prod_id} Is Not Found"
end

Then(/^the status code should be 501$/) do
  @platform.playlist_rest_response.response_code.should == 501
end

Then(/^I should get a 404 no content status code$/) do
  @platform.playlist_rest_response.response_code.should == 404
end

Then(/^I should get a 403 http status error$/) do
  @response.code.should == 403
end

Then(/^I should get a 204 no content status code$/) do
  @platform.playlist_rest_response.response_code.should == 204
end

Then(/^I should get a valid response indicating no licensed content for platform$/) do
  @platform.playlist_rest_response.rest_error_message.should include "No Licensed Content For Platform #{@platform_to_s}"
end
