When(/^I request the new playlist service$/) do
  platform = @platform.class.to_s
  @response = @platform.playlist_rest_request.get_rest_playlist(platform)
end

Then(/^I should get a valid status code$/) do
  @platform.class.to_s == 'Samsung' ? @response.code.should == 200 : @response.code.should == 501
end

Then(/^I get the correct production ID$/) do
  if @platform.class.to_s == 'Samsung'
    prod_id = JSON.parse(@response.body)['Playlist']['ProductionId'].gsub("/", "-").gsub("#", "_")
    prod_id.should match "#{EnvConfig['playlist_production']}"
  end
end
