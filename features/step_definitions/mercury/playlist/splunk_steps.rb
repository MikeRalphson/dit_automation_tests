When(/^I try to login$/) do
  @token = Mercury::SplunkResponse.splunk_session_token
end

When(/^I request the error log page$/) do
  @status_code = Mercury::SplunkResponse.elmah_ok_status_code
end

Then(/^the return value should match the secure session token$/) do
  @token.size.should == 32
end

Then(/^the HTTP status code should return OK$/) do
  @status_code.code.should == 200
end

Then(/^the response should not return these status (\d+)$/) do |codes|
  @status_code.code.should_not == codes
end
