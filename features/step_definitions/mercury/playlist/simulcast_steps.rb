When(/^I request a simulcast playlist for (.*)$/) do |channel|
  @channel = channel
  @vodcrid = channel_to_simulcast_vodcrid(@channel)
  begin
    @platform.playlist_request.data[:Vodcrid][:Id] = @vodcrid
    @platform.request_simulcast_playlist
  rescue Savon::SOAP::Fault => error
    raise "There was a problem making the simulcast playlist request. The error was: #{error}"
  end
end

Then(/^I should get a video type of simulcast$/) do
  @platform.playlist_response.simulcast_video_type.should == 'simulcast'
end


Then(/^I should get the correct vodcrid back$/) do
  @platform.playlist_response.simulcast_vodcrid.should include @vodcrid
end

Then(/^I should receive a valid playlist containing 3 streams$/) do
  @platform.playlist_response.stream_channels.size.should == 3

  bit_rate = [1200, 600, 800]
  streams = @platform.playlist_response.stream_channels.sort
  stream_id = channel_to_stream_id(@channel)

  streams.each_with_index do |stream, index|
    stream.should include "#{@channel}livefms_#{bit_rate[index]}@#{stream_id}"
  end
end

Then(/^I should get the correct base URL in the response$/) do
  content_protection_code = channel_to_content_protection_code(@channel)
  base_url = ["rtmpe://cp#{content_protection_code}.live.edgefcs.net/live"]
  @platform.playlist_response.simulcast_base_url.should == base_url
end
