Given(/^I have a valid production id$/) do
  @platform.productionid = "#{EnvConfig['playlist_production']}"
end

Given(/^I have an invalid production id$/) do
  @invalid_prodid = "#{EnvConfig['playlist_production']}".gsub('-','_')
  p @invalid_prodid
  @platform.productionid = @invalid_prodid
end

When(/^I request the new playlist service$/) do
  @platform_to_s = @platform.class.to_s.downcase
  @platform.request_rest_playlist(@platform_to_s)
  @response = @platform.playlist_rest_response
end

When(/^I request the new playlist service via http$/) do
  @platform.productionid = "#{EnvConfig['playlist_production']}"
  @platform_to_s = @platform.class.to_s
  @response = @platform.playlist_rest_request.http_request(@platform_to_s)
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
  if @platform_to_s == 'Samsung' || @platform_to_s == 'Android'
    @platform.playlist_rest_response.stub_status_code.should == 501 # stubbed response
  else
    @response.code.should == 501
  end
end

Then(/^I should get csmil in the media files url$/) do
  @platform.playlist_rest_response.media_file.should include 'csmil'
end

Then(/^I should get a valid error response$/) do
  @platform.playlist_rest_response.error_message.should include "The ProductionId #{@invalid_prodid} Is Not In The Correct Format"
end

Then(/^the status code should be 400$/) do
  @platform.playlist_rest_response.response_code.should == 400
end
