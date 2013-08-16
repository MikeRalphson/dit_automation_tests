Given(/^a demographic value is provided$/) do
  @demographic = '12345'
  @platform.playlist_request.data[:userInfo][:DM] = @demographic
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
  demographics.each { |demographic| demographic.should == 'nsp' }
end

Given(/^an (\S+) value is provided$/) do |freetext|
  @platform.playlist_request.data[:userInfo][:AdCallFreeText] = freetext
end

Then(/^(?:the same|a) (\S+) value is passed to the ad server$/) do |freetext|
  freetext = '' if freetext == 'nil' #ad urls contain // at the end if all characters are stripped
  @platform.playlist_response.add_urls.each do |url|
    url.should match /.*#{freetext}\/$/
  end
end
