Given /^I have metadata from Syndication for (\w+)$/ do |platform|
  @platform = platform
  @metadata_path = "lib/assets/#@platform/#@platform.xml"
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|Platform", @platform)
  @metadata = @xml_library.css_replace_nodes(@metadata_path, "tva|BasicDescription>tva|Title", @uuid)
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
      raise ArgumentError.new('invalid route entered')
  end
end

When /^BizTalk processes the metadata into Bloom$/ do
  @ftp ||= @ftp_library.create_ftp_connection("#{EnvConfig['ftp_host']}", "#{EnvConfig['ftp_login']}", "#{EnvConfig['ftp_password']}")
  @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication" unless @ftp.pwd.match /MetadataFromSyndication$/
  Timeout.timeout(60) { sleep 1 until (@ftp.nlst(@ftp.pwd).select { |f| f.match /#@platform.xml/ }).empty? }
  @ftp.chdir '/'
  @ftp.chdir 'MercuryFTP' unless EnvConfig['ftp_login'] == 'mercuryftp'
end

Then /^BizTalk will generate a success receipt$/ do
  temp_folder = '/tmp/mdr'
  @ftp_library.clean_local_directory temp_folder
  @ftp.sync_recent_receipts 'Receipts/MetadataReceipts', temp_folder
  receipts = Dir.glob("#{temp_folder}/*.xml")

  raise 'error - no metadata receipts found' if receipts.empty?

  errors = []
  success = false

  receipts.each do |r|
    xml = Nokogiri::XML(File.open(r))
    errors << xml.at_css("//FaultMessage").content if xml.at_css('Success').content == 'false'

    if xml.at_css('EpisodeTitle').content == @uuid && xml.at_css('Success').content == 'true'
      success == true
      break
    end
  end

  unless success
    puts errors if errors
    raise 'failed'
  end

end

