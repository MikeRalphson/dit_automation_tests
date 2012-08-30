Given /^I request the Mercury playlist with (\d+) and (\w+)$/ do |vodcrid, platform|
  @response = @mercury_playlist.playlist_request vodcrid, platform
end

When /^I get the correct bitrate based on the (.*)$/ do |platform|
  found_bitrates = @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile")
  found_bitrates = found_bitrates.map { |node| node.attr("bitrate").to_i }

  case platform
    when "android"
      expected_bitrates = [150000, 300000, 400000, 600000, 800000, 1200000]
    else
      expected_bitrates = [400000, 600000, 800000, 1200000]
  end

  comparison = (found_bitrates.to_set ^ expected_bitrates.to_set)
  raise "found bitrates: #{found_bitrates} did not match: #{expected_bitrates}" unless comparison.size == 0
end

Then /^I get the requested (\d+)$/ do |vodcrid|
  response_vodcrid = @response.xpath("//Vodcrid").text.match(/\d+$/).to_s
  response_vodcrid.should match vodcrid
end

Then /^the expiry date is in the future$/ do
  todays_date = Date.today.strftime("%FT%T")
  expiry_date = DateTime.parse(@response.xpath("//ExpiryDate").text).strftime("%FT%T")
  (todays_date > expiry_date).should == false
end