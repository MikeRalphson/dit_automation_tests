Given /^I have metadata from Syndication for (\w+)$/ do |platform|
  @platform = platform
  @metadata_path = "lib/assets/#@platform/#@platform.xml"
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|Platform", "#@platform".upcase + "ITVC")
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|BasicDescription>tva|Title", @uuid)
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|AVAttributes>tva|FileSize", (Random.rand 1000000))
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|AVAttributes>tva|MD5Checksum", '78e2bb9c60b0a621d160db06d5ec3e07')
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|AVAttributes>tva|PublishedLocation", 'priority\rtmpecatchup\1-5163-1149-004\test.mp4')
end

When /^the metadata has a null filesize value$/ do
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|AVAttributes>tva|FileSize", "")
end

When /^the metadata has a null checksum value$/ do
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|AVAttributes>tva|MD5Checksum", "")
end

When /^the metadata has a null published location value$/ do
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|AVAttributes>tva|PublishedLocation", "")
end

When /^I send metadata to BizTalk via (\w+)$/ do |route|
  case route
    when 'FTP'
      @ftp = @ftp_library.create_ftp_connection("#{EnvConfig['ftp_host']}", "#{EnvConfig['ftp_login']}", "#{EnvConfig['ftp_password']}")
      @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication"
      @ftp.put @metadata
    when 'HTTP'
      #todo
    else
      raise ArgumentError.new('no such route exists')
  end
end

When /^Biztalk validates the metadata$/ do
  @ftp ||= @ftp_library.create_ftp_connection("#{EnvConfig['ftp_host']}", "#{EnvConfig['ftp_login']}", "#{EnvConfig['ftp_password']}")
  @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication" unless @ftp.pwd.match /MetadataFromSyndication$/
  Timeout.timeout(60) { sleep 1 until (@ftp.nlst(@ftp.pwd).select { |f| f.match /#@platform.xml/ }).empty? }
  @ftp.chdir '/'
  @ftp.chdir 'MercuryFTP' unless EnvConfig['ftp_login'] == 'mercuryftp'
end

When /^BizTalk processes the metadata into Bloom$/ do
  @ftp ||= @ftp_library.create_ftp_connection("#{EnvConfig['ftp_host']}", "#{EnvConfig['ftp_login']}", "#{EnvConfig['ftp_password']}")
  @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication" unless @ftp.pwd.match /MetadataFromSyndication$/
  Timeout.timeout(60) { sleep 1 until (@ftp.nlst(@ftp.pwd).select { |f| f.match /#@platform.xml/ }).empty? }
  @ftp.chdir '/'
  @ftp.chdir 'MercuryFTP' unless EnvConfig['ftp_login'] == 'mercuryftp'
end

Then /^BizTalk will generate a success receipt$/ do
  receipts = get_receipts '/tmp/mdr'

  raise 'error - no metadata receipts found' if receipts.empty?

  errors = []
  uuid_receipt = false

  receipts.each do |r|
    xml = Nokogiri::XML(File.open(r))
    next unless xml.at_css('EpisodeTitle').content == @uuid
    uuid_receipt = true
    break if xml.at_css('Success').content == 'true'
    errors << xml.at_css("FaultMessage").content
  end

  raise "did not find any matching receipts for uuid: #@uuid" unless uuid_receipt
  raise "ingest failed with errors: #{errors}" unless errors.empty?
end

Then /^BizTalk will generate a failure receipt stating that filesize is required$/ do
  receipts = get_receipts '/tmp/mdr'
  raise 'error - no metadata receipts found' if receipts.empty?

  errors = []
  uuid_receipt = false
  expected_response = false

  receipts.each do |r|
    xml = Nokogiri::XML(File.open(r))
    next unless xml.at_css('EpisodeTitle').content == @uuid
    uuid_receipt = true
    next if xml.at_css('Success').content == 'true'
    expected_response = true
    break if xml.at_css('FaultMessage').content.match /A value for FileSize is required/
    errors << xml.at_css("FaultMessage").content
  end

  raise "did not find any matching receipts for uuid: #@uuid" unless uuid_receipt
  raise "did not find any receipts matching the expected success value" unless expected_response
  raise "ingest failed with errors: #{errors}" unless errors.empty?
end

Then /^BizTalk will generate a failure receipt stating that checksum is required$/ do
  receipts = get_receipts '/tmp/mdr'
  raise 'error - no metadata receipts found' if receipts.empty?

  errors = []
  uuid_receipt = false
  expected_response = false

  receipts.each do |r|
    xml = Nokogiri::XML(File.open(r))
    next unless xml.at_css('EpisodeTitle').content == @uuid
    uuid_receipt = true
    next if xml.at_css('Success').content == 'true'
    expected_response = true
    break if xml.at_css('FaultMessage').content.match /Checksum' element has an invalid value/
    errors << xml.at_css("FaultMessage").content
  end

  raise "did not find any matching receipts for uuid: #@uuid" unless uuid_receipt
  raise "did not find any receipts matching the expected success value" unless expected_response
  raise "ingest failed with errors: #{errors}" unless errors.empty?
end

private

def get_receipts(temp_folder)
  @ftp_library.clean_local_directory temp_folder
  @ftp.sync_recent_receipts 'Receipts/MetadataReceipts', temp_folder
  Dir.glob("#{temp_folder}/*.xml")
end
