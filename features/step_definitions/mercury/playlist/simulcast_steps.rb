When(/^I request a simulcast playlist using (\w+\d+)$/) do |vodcrid|
  begin
    @platform.playlist_request.data[:Vodcrid][:Id] = vodcrid
    @platform.request_simulcast_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Then(/^I should get a video type of simulcast in the response$/) do
  @platform.playlist_response.simulcast_video_type.should == 'simulcast'
end

Then(/^i should get the correct streams for the correct (\w+\d+)$/) do |channel|
  stream = @platform.playlist_response.simulcast_stream_channels
  stream.each { |url| url.text.should include channel }
end

Then(/^I should get the same vodcrid as (\w+\d+)$/) do |vodcrid|
  @platform.playlist_response.simulcast_vodcrid.should include vodcrid
end
