When(/^I request the new playlist service for (\w+)$/) do |platform|
  @response = @platform.playlist_rest_request.get_rest_playlist(platform)
end

Then(/^I should get a status code 200$/) do
  @response.code.should == 200
end

Then(/^I get the correct production ID$/) do
  p @response.body
  prod_id = JSON.parse(@response.body)['ProductionId'].gsub("/","-").gsub("#","_")
  prod_id.should match "#{EnvConfig['playlist_production']}"
end

Then(/^I should get a valid response for (\w+)$/) do |platform|
  @response = @platform.request_rest_playlist(platform)
  @response.should_not be_empty
end
