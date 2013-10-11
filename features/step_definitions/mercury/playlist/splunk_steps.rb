Given(/^I have a valid search results set$/) do
  @jobs = @platform.splunk_response.get_job_id
end

When /^I request the Mercury playlist for Splunk$/ do
  begin
    @platform.playlist_request.data[:request][:ProductionId] = Utils.static_prod_id
    @platform.playlist_request.data
    @platform.request_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When(/^I login in to (\w+) Splunk$/) do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new
  @splunk = @platform.splunk_response
end

When(/^I request the error log page for (\w+)$/) do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new
  @status_code = @platform.splunk_response.elmah_ok_status_code
end

When(/^I send a query request to Splunk$/) do
  @splunk_data = @platform.splunk_response.get_mercury_data
end

Then(/^the return value should match the secure session token$/) do
  @splunk.token.size.should == 32
end

Then(/^the HTTP status code should return OK$/) do
  @status_code.code.should == 200
end

Then(/^the response should not return these status (\d+)$/) do |codes|
  @status_code.code.should_not == codes
end

Then(/^I should get the correct playlist data from Splunk$/) do
  Utils.wait_for(10) do
    current_results = @platform.splunk_response.splunk_platforms_for(Utils.static_prod_id).sort
    current_results.map(&:downcase).include? @platform.class.to_s.downcase
  end
  splunk_time = @platform.splunk_response.splunk_check_time
  DateTime.parse(splunk_time)
  @platform.splunk_response.check_request_name.should == "mercury.playlist.request"
end
