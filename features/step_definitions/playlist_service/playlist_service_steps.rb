When(/^I request the new playlist service$/) do
  @platform_to_s = @platform.class.to_s.downcase
  @platform.request_rest_playlist(@platform_to_s)
  @response = @platform.playlist_rest_response
end

When(/^I request the new playlist service via http$/) do
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
  if @platform_to_s == 'Samsung' || 'Android'
    @platform.playlist_rest_response.stub_status_code.should == 501 # stubbed response
  else
    @response.code.should == 501
  end
end

Then(/^I should get csmil in the media files url$/) do
  @platform.playlist_rest_response.media_file.should include 'csmil'
end
