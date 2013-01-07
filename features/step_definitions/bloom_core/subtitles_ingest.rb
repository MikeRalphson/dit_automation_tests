class NoSubsError < RuntimeError; end
class IncorrectSubsFileError < RuntimeError; end
class IncorrectProdidError < RuntimeError; end

def extract_ids(result)
  @vodcrid = result.first[1].gsub(/\D/,'')
  @prodid = result.first[0]
  @stripped_prodid = @prodid.gsub(/\//,'').gsub('#','')
end

def local_ingest(platform, prodid = nil)
  std_opts = {
    :extension => '.mp4',
    :bitrates => [400, 600, 800, 1200],
    :platforms => [platform],
    :licence => 'First TX'
  }

  std_opts[:prodid] = prodid if prodid

  @client = IngestRb::LocalClient.new(std_opts)
  @platform = platform
end

def make_playlist_request(old_timestamp = nil)
  playlist_client = @mercury_playlist.create_client
  response = nil
  retryable :on => RuntimeError, :times => 10, :sleep => 1 do
    response = @mercury_playlist.playlist_request(@playlist_client, @vodcrid, @platform)
    subs = response.xpath('//ClosedCaptioningURIs/URL')
    prodid = response.xpath('//ProductionId')
    raise NoSubsError if subs.size == 0
    raise IncorrectSubsFileError if old_timestamp && subs[0].text.include?(old_timestamp)
    raise IncorrectProdidError if prodid && (prodid.text != @prodid) #TODO: investigate this issue (race in Bloom which can return bogus playlist for vodcrid)
  end
  @response = Nokogiri::XML(response.to_xml).remove_namespaces!
end

def extract_metadata_from_subs_filename(path)
  unique_data = path.match("#@stripped_prodid.*?.xml").to_s.gsub('.xml','').split('_')
  { :prodid => unique_data[0], :timestamp => unique_data[1] }
end

Given /^I have a production for the "(.*?)" platform$/ do |platform|
  local_ingest platform
end

Given /^I ingest with subtitles$/ do
  result = @client.ingest
  extract_ids result
end

When /^I request the playlist for the production$/ do
  make_playlist_request(@first_subs_timestamp)
end

Then /^the response should contain the path to the subtitles$/ do
  subs = @response.search('ClosedCaptioningURIs > URL').text
  subs.should include @stripped_prodid
end

Given /^I have already ingested a "(.*?)" production with subtitles$/ do |platform|
  @platform = platform
  local_ingest platform
  result = @client.ingest
  extract_ids result
  make_playlist_request
  @first_subs = @response.search('ClosedCaptioningURIs > URL').text
  @first_subs_timestamp = extract_metadata_from_subs_filename(@first_subs)[:timestamp]
end

Given /^I ingest again for the same production with an updated subtitles file$/ do
  local_ingest(@platform, @prodid)
  result = @client.ingest
  extract_ids result
end

Then /^the response should contain a single subtitles file$/ do
  subs = @response.search('ClosedCaptioningURIs > URL')
  subs.size.should == 1
  @second_subs = subs[0].text
end

Then /^the response should contain the path to the updated file$/ do
  subs1 = extract_metadata_from_subs_filename(@first_subs)
  subs2 = extract_metadata_from_subs_filename(@second_subs)
  subs1[:prodid].should == subs2[:prodid] #check prodids are the same
  subs1[:timestamp].should_not == subs2[:timestamp] #check time is not the same
end
