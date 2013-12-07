When(/^I request the new playlist service$/) do
  platform = @platform.class.to_s.downcase
  @platform.request_rest_playlist(platform)
  @response = @platform.playlist_rest_response
end

Then(/^I should get a valid status code$/) do
  @platform.class.to_s == 'Samsung' ? @response.response_code.should == 200 : @response.response_code.should == 501
end

Then(/^I get the correct production ID$/) do
  if @platform.class.to_s == 'Samsung'
    @response.production_id.should match "#{EnvConfig['playlist_production']}"
  end
end
