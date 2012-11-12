Given /^I request the Mercury playlist for (.*) with null additional parameters$/ do |platform|
  #pending
  @playlist_client = @mercury_playlist.create_client
  @vodcrid = @vodcrid_helpers.get_vodcrid_from_config(platform)
  @mercury_playlist.mobile_playlist_request(@playlist_client, @vodcrid, platform)
end

Given /^I request the Mercury playlist for (.*) with additional parameters in uppercase$/ do |platform|
  pending
end

Given /^I request the Mercury playlist for (.*) with additional parameters containing special characters$/ do |platform|
  pending
end

Given /^I request the Mercury playlist for (.*) with additional parameters over 100 characters long$/ do |platform|
  pending
end

Given /^I request the Mercury playlist for (.*) with additional parameters$/ do |platform|
  pending
end

Given /^I request the Mercury playlist for (.*) without additional parameters$/ do |platform|
  pending
end

Then /^the response should contain ad-server URL's with empty additional parameter values$/ do
  pending
end

Then /^the response should contain ad-server URL's with no additional parameters$/ do
  pending
end

Then /^the response should contain ad-server URL's with correctly appended additional parameters$/ do
  pending
end

Then /^the response should contain ad-server URL's with truncated additional parameters$/ do
  pending
end

Then /^the response should contain dots for special characters in the ad-server URL's$/ do
  pending
end

Then /^the response should contain lowercase characters in the ad-server URL's$/ do
  pending
end
