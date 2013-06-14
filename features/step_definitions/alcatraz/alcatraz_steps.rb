Given /^I request the secure token from Alcatraz$/ do
  uri = "#{EnvConfig['alcatraz_url']}/api/xml/ConcurrentPlayback/GenerateToken"
  @response = get_response_from_url(uri).to_xml!
end

Given /^I request the cross domain XML from Alcatraz$/ do
  uri = "#{EnvConfig['alcatraz_url']}/crossdomain.xml"
  @response = get_response_from_url(uri).to_xml!
end

Then /^the secure token should be correct$/ do
  @response.xpath('//UserToken').text.should == 'C476554604DCFC01FAC0390678CD9331'
end

Then /^it should allow access across all sites on the ITV domain$/ do
  @response.xpath('//allow-access-from').attribute('domain').text.should == '*.itv.com'
end
