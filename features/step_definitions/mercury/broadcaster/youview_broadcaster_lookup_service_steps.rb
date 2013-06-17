When /^I make a YouView Broadcaster Lookup request for (.*)$/ do |region|
  @response = open("#{EnvConfig['mercury_url']}/api/xml/youview/broadcaster/#{region}").read
end

Then /^the response should contain (.*) broadcaster$/ do |broadcaster|
  @response.to_xml!.xpath('//Broadcaster').text.should == broadcaster
end

Then /^the response should contain (.*) error$/ do |error|
  @response.to_xml!.xpath('//Error').text.should == error
end
