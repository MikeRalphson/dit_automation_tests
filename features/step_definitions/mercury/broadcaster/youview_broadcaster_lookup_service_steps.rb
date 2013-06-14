When /^I make a YouView Broadcaster Lookup request for (.*)$/ do |region|
  @response = open("#{EnvConfig['mercury_url']}/api/xml/youview/broadcaster/#{region}").read
end

Then /^the response should contain (.*) broadcaster$/ do |broadcaster|
  xml = @response.to_xml!
  unless @mercury_api.value_exists_in_xml_node?(xml, 'Broadcaster', broadcaster)
    raise "Incorrect Broadcaster region found was expecting #{broadcaster}"
  end
end

Then /^the response should contain (.*) error$/ do |error|
  xml = @response.to_xml!
  unless @mercury_api.value_exists_in_xml_node?(xml, 'Error', error)
    raise "The following message is returned: #{error}"
  end
end
