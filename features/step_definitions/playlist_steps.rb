Given /^I request the Mercury playlist with (\d+) and (\w+)$/ do |vodcrid, platform|
  @response = @mercury_playlist.mobile_playlist_request vodcrid, platform
end

Then /^I get the correct bitrate based on the (.*)$/ do |platform|
  found_bitrates = @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile")
  found_bitrates = found_bitrates.map { |node| node.attr("bitrate").to_i }

  case platform
    when "android"
      expected_bitrates = [150000, 300000, 400000, 600000, 800000, 1200000]
    when "Samsung"
      expected_bitrates = [1200000]
    when "YouView"
      expected_bitrates = [1200000]
    when "PS3"
      expected_bitrates = [800000]
    when "Mobile"
      expected_bitrates = [400000]
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

Then /^I get the correct base url based on the (.+)$/ do |platform|
  base_urls = @response.xpath("//MediaFiles")
  base_urls.should_not be_empty

  case platform
    when "YouView"
      base_urls.each { |url| url.attr("base").should match(/\Ayouview/) }
    else
      base_urls.each { |url| url.attr("base").should match(/\Artmpe/) }
  end
end
