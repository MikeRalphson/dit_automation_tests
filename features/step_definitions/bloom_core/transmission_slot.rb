def local_ingest_with_transmission(platform, category, transmission_slot = nil, prodid = nil)
  std_opts = {
    :extension => '.mp4',
    :bitrates => [400, 600, 800, 1200],
    :platforms => [platform],
    :licence => 'First TX'
  }

  std_opts[:prodid] = prodid if prodid
  std_opts[:category] = category if category
  std_opts[:transmission_slot] = transmission_slot if transmission_slot

  @client = IngestRb::LocalClient.new(std_opts)
end

Given /^I ingest "(.*?)" metadata with "(.*?)" assets into Bloom$/ do |platform, category|
  local_ingest_with_transmission(platform, category, '2013-06-11T03:30:00')
  @metadata = @client.ingest_metadata
end

Given /^I ingest "(.*?)" metadata with "(.*?)" assets into Bloom with no transmission slot$/ do |platform, category|
  local_ingest_with_transmission(platform, category, '0001-01-01T00:00:00')
  @metadata = @client.ingest_metadata
end

When /^I request file metadata for the assets$/ do
  @response = @client.file_query(@metadata)
end

Then /^I should see the correct transmission slot in the response$/ do
  @response.xml.search('Key').each do |elem|
    if elem.content == 'TransmissionSlot'
      datetime = Date.parse(elem.next_sibling.content)
      datetime.year.should == 2013
      datetime.month.should == 6
      datetime.day.should == 11
    end
  end
end

Then /^I should not see the correct transmission slot in the response$/ do
  @response.xml.search('Key').each do |elem|
    if elem.content == 'TransmissionSlot'
      value = elem.next_sibling.content
      raise 'TransmissionSlot Found for metadata with no transmission slot' unless value.empty?
    end
  end
end
