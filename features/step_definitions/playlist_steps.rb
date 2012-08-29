Given /^I request the Mercury playlist with (\d+) and (\w+)$/ do |vodcrid, platform|
  @response = @mercury_playlist.playlist_request vodcrid, platform
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
