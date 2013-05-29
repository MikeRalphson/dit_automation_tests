Given /^I request the mrss api$/ do
  yesterday = (Date.today - 1).strftime('%Y%m%d')
  @uri = "#{EnvConfig['mercury_url']}/linking/#{yesterday}"
  @response = @mercury_api.get_response_from_url @uri
end

Given /^I request the (\w+) (\w+) (.*) api$/ do |type, platform, uri|
  @uri = "#{EnvConfig['mercury_url']}/api/#{type}/#{platform}/#{uri}"
  @response = @mercury_api.get_response_from_url @uri
end

Then /^I get a successful (\w+) response with the correct (\w+)$/ do |type, platform|
  case type
    when 'xml'
      xml = @mercury_api.get_xml_from_response @response
      unless @mercury_api.value_exists_in_xml_node?(xml, 'Value', platform)
        raise "could not find the correct platform value: #{platform} in the response for uri: #@uri"
      end
    when 'json'
      json = @mercury_api.parse_json_response @response
      @mercury_api.find_value_in_hash('Platform', json).should == platform
    when 'mhegdata'
      unless @mercury_api.value_exists_in_mhegdata?(@response, @uri)
        raise "could not find the correct uri value: #@uri in the response for uri: #@uri"
      end
    else
      raise ArgumentError.new('invalid API request type')
  end
end

Then /^the response should contain entries for each of the last 7 days$/ do
  xml = @mercury_api.get_xml_from_response @response
  expected_week = @mercury_api.calculate_week
  actual_week = @mercury_api.get_values_from_xml xml, 'Title'
  difference = (expected_week.to_set ^ actual_week.to_set)
  difference.size.should == 0
end

Then /^the response should contain the correct (.*)$/ do |title|
  xml = @mercury_api.get_xml_from_response @response
  unless @mercury_api.value_exists_in_xml_node?(xml, 'title', title)
    raise 'error with mrss feed'
  end
end

Then /^all the links href should point to the Drupal site$/ do
  xml = @mercury_api.get_xml_from_response @response
  href = xml.xpath('//entry/link').each { |e| e['href'].should =~ /(http|https):\/\/\w{3,5}\.itv.com\/itvplayer\// }
end

Then /^the response should contain a complete A-Z listing$/ do
  a_to_z = ['A - B', 'C - D', 'E - F', 'G - H', 'I - J', 'K - L', 'M - N',
            'O - P', 'Q - R', 'S - T', 'U - V', 'W - X', 'Y - Z', '0 - 9']
  xml = @mercury_api.get_xml_from_response @response
  found_values = a_to_z.map { |index| index if @mercury_api.value_exists_in_xml_node?(xml, 'Title', index) }
  comparison = (found_values.to_set ^ a_to_z.to_set)

  unless comparison.size == 0
    raise "complete A-Z listing was not found. The exact failures were: #{comparison.inspect}}"
  end
end
