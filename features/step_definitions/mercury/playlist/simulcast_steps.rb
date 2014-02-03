When(/^I request a simulcast playlist using (\w+\d+)$/) do |vodcrid|
  begin
    @platform.playlist_request.data[:Vodcrid][:Id] = vodcrid
    @platform.request_simulcast_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Then(/^I should get a video type of simulcast$/) do
  @platform.playlist_response.simulcast_video_type.should == 'simulcast'
end


Then(/^I should get (\w+\d+) in the response$/) do |vodcrid|
  @platform.playlist_response.simulcast_vodcrid.should include vodcrid
end

Then(/^I should receive a valid playlist containing 3 (.*) with (.*)$/) do |stream_id, channel|
  bit_rate = [1200, 600, 800]
  @platform.playlist_response.simulcast_stream_channels.size.should == 3
  streams = @platform.playlist_response.simulcast_stream_channels.sort
  streams.each_with_index do |stream, index|
    stream.should include "#{channel}livefms_#{bit_rate[index]}@#{stream_id}"
  end
end

Then(/^I should get the (.*) in the response$/) do |base_url|
  @platform.playlist_response.simulcast_base_url.should include base_url
end
