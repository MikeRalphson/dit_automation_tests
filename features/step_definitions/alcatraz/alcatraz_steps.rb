Given /^I request the secure token from Alcatraz$/ do
  uri = "#{EnvConfig['alcatraz_url']}/api/xml/ConcurrentPlayback/GenerateToken"
  @response = string_to_xml!(get_response_from_url(uri))
end

Given /^I request the cross domain XML from Alcatraz$/ do
  uri = "#{EnvConfig['alcatraz_url']}/crossdomain.xml"
  @response = string_to_xml!(get_response_from_url(uri))
end

Then /^the secure token should be correct$/ do
  @response.xpath('//UserToken').text.should == 'C476554604DCFC01FAC0390678CD9331'
end

Then /^it should allow access across all sites on the ITV domain$/ do
  @response.xpath('//allow-access-from').attribute('domain').text.should == '*.itv.com'
end
