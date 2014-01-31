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


Then(/^I should get the same vodcrid as (\w+\d+)$/) do |vodcrid|
  @platform.playlist_response.simulcast_vodcrid.should include vodcrid
end

Then(/^I should receive a valid playlist containing 3 (.*) and the (.*)$/) do |streams, base_url|
  @platform.playlist_response.simulcast_stream_channels.size.should == 3
  @platform.playlist_response.simulcast_base_url.should include base_url
  @platform.playlist_response.simulcast_stream_channels.map do |renditions|
    i = 0
    renditions.should include streams[i]
    i += 1
  end
end
