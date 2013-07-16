Given(/^a demographic value is provided$/) do
  @demographic = '12345'
  @platform.playlist_request.data['demographic'] = @demographic
end

Given(/^no demographic value is provided$/) do
  @platform.playlist_request.data['demographic'] = nil
end

Then(/^the same demographic value should be passed to the ad server$/) do
  demographics = @platform.playlist_response.demographics.flatten
  demographics.each { |demographic| demographic.should == @demographic }
end

Then(/^a default demographic value should be passed to the ad server$/) do
  demographics = @platform.playlist_response.demographics.flatten
  demographics.each { |demographic| demographic.should == 'nli' }
end

Then(/^the default non\-supported platform demographic value should be passed to the ad server$/) do
  demographics = @platform.playlist_response.demographics.flatten
  demographics.each { |demographic| demographic.should == '0000-0000-0000-0000' }
end
