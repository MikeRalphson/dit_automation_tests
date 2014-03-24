Given(/^I have a broadcast type of (\w+)$/) do |broadcast|
  @broadcast = broadcast
  @platform.playlist_rest_request.broadcast = @broadcast
end

Given(/^I have an invalid format production id$/) do
  @invalid_prodid = "#{EnvConfig['playlist_production']}".gsub('-','_')
  @platform.playlist_rest_request.productionid = @invalid_prodid
end

Given(/^I have no asset information for that production id$/) do
  @platform.playlist_rest_request.productionid = "#{EnvConfig['no_assets_prodid']}"
end

Given(/^I have no rendtions for a production id$/) do
  @platform.playlist_rest_request.productionid = "#{EnvConfig['no_renditions']}"
end

Given(/^I have a production id which has invalid rendition names$/) do
  @platform.production = "#{EnvConfig['generic_production']}"
end

When(/^I request the new playlist service$/) do
  @platform.request_rest_playlist
end

When(/^I request the new playlist service via http$/) do
  begin
    @platform.playlist_rest_request.http_request
  rescue Errno::ECONNREFUSED => error
      @refused_connection = error.to_s
  end
end

When(/^I request the playlist service with a blank hmac token for supported platforms$/) do
    @response = @platform.playlist_rest_request.blank_hmac_token(@platform.class.to_s.downcase)
end

Then(/^I should get a 200 status code$/) do
  @platform.class.to_s == 'Samsung' || @platform.class.to_s == 'Android' ? @platform.playlist_rest_response.response_code.should == 200 : @platform.playlist_rest_response.response_code.should == 501
end

Then(/^I should get the correct production ID$/) do
  if @platform_to_s == 'Samsung' || @platform_to_s == 'Android'
    @platform.playlist_rest_response.production_id.should match "#{EnvConfig['playlist_production']}"
  end
end

Then(/^I should get a connection refused message$/) do
  @refused_connection.should include "Connection refused - connect(2)"
end

Then(/^I should get csmil in the media files url$/) do
  @platform.playlist_rest_response.media_file.should include 'csmil'
end

Then(/^I should get an invalid format response message$/) do
  @platform.playlist_rest_response.rest_error_message.should include "The ProductionId #{@invalid_prodid} Is Not In The Correct Format"
end

Then(/^then I should get a 400 status code$/) do
  @platform.playlist_rest_response.response_code.should == 400
end

Then(/^I should get a platform not supported message$/) do
  platform = @platform.playlist_rest_request.platform
  @platform.playlist_rest_response.rest_error_message.should include "The Playlist Functionality For The Platform #{platform} Is Not Available"
end

Then(/^I should get a broadcast not implemented response$/) do
  @platform.playlist_rest_response.rest_error_message.should include "The Playlist Functionality For The Broadcaster #{@broadcast} Is Not Available"
end

Then(/^I should get a no assets found response$/) do
  @no_assets_prod_id = "#{EnvConfig['no_assets_prodid']}".gsub('-','/').gsub('_','#')
  @platform.playlist_rest_response.rest_error_message.should include "Asset Information For Production Id #{@no_assets_prod_id} Is Not Found"
end

Then(/^then I should get 501 status code$/) do
  @platform.playlist_rest_response.response_code.should == 501
end

Then(/^I should get a 404 not found status code$/) do
  @platform.playlist_rest_response.response_code.should == 404
end

Then(/^I should get a 403 forbidden response code/) do
  @response.response.code.should == "403"
end

Then(/^I should get a 204 no content status code$/) do
  @platform.playlist_rest_response.response_code.should == 204
end

Then(/^I should get a valid response indicating no licensed content for platform$/) do
  @platform.playlist_rest_response.rest_error_message.should include "No Licensed Content For Platform #{@platform_to_s}"
end

Then(/^the response should contain a base uri populated with the Akamai config$/) do
  @platform.playlist_rest_response.base_uri.should include "itvandroidhls-vh.akamaihd.net/i/"
end

Then(/^I should get a match uri And bitrate pattern error response$/) do
  #new playlist requires the format in the rendition names to be: itv{bitrate}
  #Example: @"(?<StartUri>[\W\w]+)(?<Partner>(?i)_itv)(?<Bitrate>[0-9]+)(?<EndUri>[\W\w]+)"
  #Example Android: @"(?<StartUri>[\W\w]+)(?<Partner>(?i)_bl)(?<Bitrate>[0-9]+)(?<EndUri>[\W\w]+)"
  @playlist_error.to_s.should include "Unable To Match Uri And Bitrate Pattern"
end
