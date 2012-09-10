Given /^I have valid android metadata from Syndication$/ do
  @metadata = File.open('lib/assets/android/AndroidMetadata.xml')
end

When /^BizTalk processes the metadata into Bloom$/ do
  @ftp = @ftp_library.create_ftp_connection 'S01-ITVONLINEFTP.ITV.COM', 'mercuryftp', '9d$]q1H&g+\>'
  @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication"
  @ftp.put @metadata
  Timeout.timeout(20) { sleep 1 until (@ftp.nlst(@ftp.pwd).select { |f| f.match /AndroidMetadata.xml/ }).empty? }
  @ftp.chdir '/'
end

Then /^BizTalk will generate a success receipt$/ do
  temp_folder = '/tmp/mdr'
  @ftp_library.clean_local_directory temp_folder
  @ftp.sync_recent_receipts 'Receipts/MetadataReceipts', temp_folder
  receipts = Dir.glob("#{temp_folder}/*.xml")

  receipts.each do |r|
    xml = Nokogiri::XML(File.open(r))
    puts xml.at_css('Success').content
    #found == true if (xml.at_css('Success').content) == 'true'
    #(xml.at_css('EpisodeTitle').content) == @uuid

  end
end
