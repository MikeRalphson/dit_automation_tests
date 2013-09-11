When(/^I try to login$/) do
  @token = Mercury::SplunkResponse.splunk_session_token
end

Then(/^the return value should match the secure session token$/) do
  @token.size.should == 32
end
