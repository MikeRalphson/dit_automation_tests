Given /^I request the master feed for (\w+) and (\w+) with (\w+)$/ do |broadcaster, platform, screen_size|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?screensize=#{screen_size}&broadcaster=#{broadcaster}"
  @response = @mercury_api.get_response_from_url @uri
end

Given /^I request the master feed for (\w+) and (\w+)$/ do |platform, broadcaster|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?broadcaster=#{broadcaster}"
  @response = @mercury_api.get_response_from_url @uri
end

Then /^the response should include the feed (.*)$/ do |title|
  xml = @mercury_api.get_xml_from_response @response
  raise 'invalid content found in response' unless @mercury_api.value_exists_in_xml_node?(xml, 'Title', title)
end

Then /^the response should not include the feed (.*)$/ do |title|
  xml = @mercury_api.get_xml_from_response @response
  raise 'invalid content found in response' if @mercury_api.value_exists_in_xml_node?(xml, 'Title', title)
end
