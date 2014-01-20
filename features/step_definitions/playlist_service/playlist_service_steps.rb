When(/^I request the new playlist service$/) do
  platform = @platform.class.to_s.downcase
  @platform.request_rest_playlist(platform)
  @response = @platform.playlist_rest_response
end

When(/^I request the new playlist service via http$/) do
  platform = @platform.class.to_s.downcase
  @response = @platform.playlist_rest_request.http_request(platform)
end

Then(/^I should get a valid status code$/) do
  @platform.class.to_s == 'Samsung' || @platform.class.to_s == 'Android' ? @response.response_code.should == 200 : @response.response_code.should == 501
end

Then(/^I get the correct production ID$/) do
  if @platform.class.to_s == 'Samsung'
    @response.production_id.should match "#{EnvConfig['playlist_production']}"
  end
end

Then(/^I should get a status code of 501$/) do
  if @platform.class.to_s == 'Samsung' || 'Android'
    @platform.playlist_rest_response.stub_status_code.should == 501 # stubbed response
  else
    @response.code.should == 501
  end
end
