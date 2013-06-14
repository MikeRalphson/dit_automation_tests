When /^I make a YouView Broadcaster Lookup request for (.*)$/ do |region|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/youview/broadcaster/#{region}"
  @response = open(@uri).read
end

Then /^the response should contain (.*) broadcaster$/ do |broadcaster|
  xml = @mercury_api.get_xml_from_response @response
  unless @mercury_api.value_exists_in_xml_node?(xml, 'Broadcaster', broadcaster)
    raise "Incorrect Broadcaster region found was expecting #{broadcaster}"
  end
end

Then /^the response should contain (.*) error$/ do |error|
  xml = @mercury_api.get_xml_from_response @response
  unless @mercury_api.value_exists_in_xml_node?(xml, 'Error', error)
    raise "The following message is returned: #{error}"
  end
end
