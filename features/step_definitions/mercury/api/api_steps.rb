Given /^I request the mrss api$/ do
  yesterday = (Date.today - 1).strftime('%Y%m%d')
  @uri = "#{EnvConfig['mercury_url']}/linking/#{yesterday}"
  @response = open(@uri).read
end

Given /^I request the (\w+) (\w+) (.*) api$/ do |type, platform, uri|
  @uri = "#{EnvConfig['mercury_url']}/api/#{type}/#{platform}/#{uri}"
  @response = open(@uri).read
end

Then /^I get a successful (\w+) response with the correct (\w+)$/ do |type, platform|
  case type
    when 'xml'
      xml = @response.to_xml!
      unless @mercury_api.value_exists_in_xml_node?(xml, 'Value', platform)
        raise "could not find the correct platform value: #{platform} in the response for uri: #{@uri}"
      end
    when 'json'
      json = @response.to_json
      @mercury_api.find_value_in_hash('Platform', json).should == platform
    when 'mhegdata'
      @response.should include(@uri)
    else
      raise ArgumentError.new('invalid API request type')
  end
end

Then /^the response should contain entries for each of the last 7 days$/ do
  expected_week = @mercury_api.calculate_week
  actual_week = @mercury_api.get_values_from_xml(@response.to_xml!, 'Title')
  actual_week.should match_array(expected_week)
end

Then /^the response should contain the correct (.*)$/ do |title|
  xml = @response.to_xml!
  unless @mercury_api.value_exists_in_xml_node?(xml, 'title', title)
    raise 'error with mrss feed'
  end
end

Then /^all the links href should point to the Drupal site$/ do
  xml = @response.to_xml!
  xml.xpath('//entry/link').each { |e| e['href'].should =~ /(http|https):\/\/\w{3,5}\.itv.com\/itvplayer\// }
end

Then /^the response should contain a complete A-Z listing$/ do
  expected_values = ['A - B', 'C - D', 'E - F', 'G - H', 'I - J', 'K - L', 'M - N',
                     'O - P', 'Q - R', 'S - T', 'U - V', 'W - X', 'Y - Z', '0 - 9']
  xml = @response.to_xml
  actual_values = expected_values.map { |index| index if @mercury_api.value_exists_in_xml_node?(xml, 'Title', index) }
  actual_values.should match_array(expected_values)
end
