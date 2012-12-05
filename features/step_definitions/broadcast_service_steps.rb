Given /^I request the content for (\w+) and (\w+) with (\w+)$/ do |broadcaster, platform, screen_size|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?screensize=#{screen_size}&broadcaster=#{broadcaster}"
  @response = @mercury_api.get_response_from_url @uri
end

Given /^I request the content for (\w+) and (\w+)$/ do |broadcaster, platform|
  @uri = "#{EnvConfig['mercury_url']}/api/xml/#{platform}?broadcaster=#{broadcaster}"
  @response = @mercury_api.get_response_from_url @uri
end

Then /^the response should contain channel (.*)$/ do |content|
  xml = @mercury_api.get_xml_from_response @response
  raise 'invalid content found in response' unless @mercury_api.value_exists_in_xml_node?(xml, "Title", content)
end

Then /^the response should not contain (.*)$/ do |content|
  xml = @mercury_api.get_xml_from_response @response
  raise 'invalid content found in response' if @mercury_api.value_exists_in_xml_node?(xml, "Title", content)
end

Then /^the masterfeed should contain the expected (.*)$/ do |links|
  xml = @mercury_api.get_xml_from_response @response
  link = xml.search("//Link")
  result = link.find { |v| v.text.include? links }
  raise "Cannot find value #{links}" unless result
end

