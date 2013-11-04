When(/^I request the new playlist service for (\w+)$/) do |platform|
  @response = @platform.playlist_rest_request.get_rest_playlist(platform)
end

Then(/^I should get a valid status code for (\w+)$/) do |platform|
  unless platform == 'Samsung'
    @response.code.should == 400
  else
    @response.code.should == 200
  end
end

Then(/^I get the correct production ID for (\w+)$/) do |platform|
  if platform == 'Samsung'
    prod_id = JSON.parse(@response.body)['ProductionId'].gsub("/", "-").gsub("#", "_")
    prod_id.should match "#{EnvConfig['playlist_production']}"
  end
end
