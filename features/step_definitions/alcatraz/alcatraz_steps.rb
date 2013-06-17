Given /^I request the secure token from Alcatraz$/ do
  @response = open("#{EnvConfig['alcatraz_url']}/api/xml/ConcurrentPlayback/GenerateToken").read.to_xml!
end

Given /^I request the cross domain XML from Alcatraz$/ do
  @response = open("#{EnvConfig['alcatraz_url']}/crossdomain.xml").read.to_xml!
end

Then /^the secure token should be correct$/ do
  @response.xpath('//UserToken').text.should == 'C476554604DCFC01FAC0390678CD9331'
end

Then /^it should allow access across all sites on the ITV domain$/ do
  @response.xpath('//allow-access-from').attribute('domain').text.should == '*.itv.com'
end
