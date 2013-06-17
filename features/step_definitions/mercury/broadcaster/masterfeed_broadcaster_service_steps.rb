Then /^the master feed should contain the expected (.*) for the requested broadcaster$/ do |links|
  xml = @response.to_xml!
  link = xml.search('//Link')
  result = link.find { |v| v.text.include? links }
  raise "Cannot find value #{links}" unless result
end
