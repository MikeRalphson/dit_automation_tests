Given /^I request the MRSS API$/ do
  yesterday = (Date.today - 1).strftime('%Y%m%d')
  @response = open("#{EnvConfig['mercury_url']}/linking/#{yesterday}").read
end

Given /^I request the (\w+) (\w+) (.*) api$/ do |type, platform, uri|
  @uri = "#{EnvConfig['mercury_url']}/api/#{type}/#{platform}/#{uri}"
  @response = open(@uri).read
end

Given /^I request the (\w+) (\w+) (\w+) for a smil$/ do |type, platform, uri|
  smil_prod_id = "#{EnvConfig['generic_production']}".gsub("/","-").gsub("#","_") # samsung uses prod id not vodcrid
  platform == 'samsung' ? id = smil_prod_id : id = "#{EnvConfig['smil_vodcrid']}"
  @uri = "#{EnvConfig['mercury_url']}/api/#{type}/#{platform}/#{uri}/#{id}.smil"
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
      @response.downcase.should include(@uri)
    else
      raise ArgumentError.new('invalid API request type')
  end
end

Then /^the response should contain entries for each of the last 7 days$/ do
  expected_week = @mercury_api.calculate_week
  actual_week = @response.to_xml!.xpath('//Title').map { |match| match.text }
  actual_week.should match_array(expected_week)
end

Then /^all the links should point to the ITV Player site$/ do
  xml = @response.to_xml!
  links = xml.xpath('//entry/link').map { |link| link.attr('href') }
  links.should_not be_nil
  links.each { |link| link.should match(/^http:\/\/(\w*-?)www.itv.com\/itvplayer/) }
end

Then /^the response should contain a complete A-Z listing$/ do
  expected_values = ['A - B', 'C - D', 'E - F', 'G - H', 'I - J', 'K - L', 'M - N',
                     'O - P', 'Q - R', 'S - T', 'U - V', 'W - X', 'Y - Z', '0 - 9']
  xml = @response.to_xml!
  actual_values = xml.xpath('//Title').map { |match| match.text }
  actual_values.should match_array(expected_values)
end

Then(/^the response should contain no empty video urls$/) do
  video_links = @response.to_xml!.xpath('//switch/video')
  video_links.should_not be_empty
end

Then(/^the bitrate should be included in the video url$/) do
  video_links = @response.to_xml!.xpath('//switch/video').map { |links| links.attr('src') }
  bitrates = @response.to_xml!.xpath('//switch/video').map { |bitrate| bitrate.attr('bitrate').gsub(/00000/, '00') }
  video_links[0].should include(bitrates[0])
end
