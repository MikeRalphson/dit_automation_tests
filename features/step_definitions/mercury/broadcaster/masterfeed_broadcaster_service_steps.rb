Then /^the master feed should contain the expected (.*) for the requested broadcaster$/ do |links|
  xml = @mercury_api.get_xml_from_response @response
  link = xml.search("//Link")
  result = link.find { |v| v.text.include? links }
  raise "Cannot find value #{links}" unless result
end
