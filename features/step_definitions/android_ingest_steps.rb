Given /^I have valid metadata from Syndication for (\w+)$/ do |platform|
  contents = File.open("lib/assets/#{platform}/#{platform}.xml") { |f| f.read }
  replace = contents.gsub(/<tva:Platform>.+<\/tva:Platform>/, "<tva:Platform>#{platform}</tva:Platform>")
  File.open("lib/assets/#{platform}/#{platform}.xml", "w") { |f| f.puts replace }
  @metadata = File.open("lib/assets/#{platform}/#{platform}.xml")
end

When /^I send metadata to BizTalk via FTP$/ do
  @ftp = @ftp_library.create_ftp_connection("#{EnvConfig['ftp_host']}", "#{EnvConfig['ftp_login']}", "#{EnvConfig['ftp_password']}")
  @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication"
  @ftp.put @metadata
end

When /^I send metadata to BizTalk via HTTP$/ do
  response = Net::HTTP.put('path', 'data')
  response.should == '202'
end

When /^BizTalk processes the metadata into Bloom for (\w+)$/ do |platform|
  @ftp ||= @ftp_library.create_ftp_connection("#{EnvConfig['ftp_host']}", "#{EnvConfig['ftp_login']}", "#{EnvConfig['ftp_password']}")
  @ftp.chdir "CatchUpAndArchive/MetadataFromSyndication" unless @ftp.pwd.match /MetadataFromSyndication$/
  Timeout.timeout(60) { sleep 1 until (@ftp.nlst(@ftp.pwd).select { |f| f.match /#{platform}.xml/ }).empty? }
  @ftp.chdir '/'
  @ftp.chdir 'MercuryFTP' unless EnvConfig['ftp_login'] == 'mercuryftp'
end

Then /^BizTalk will generate a success receipt$/ do
  temp_folder = '/tmp/mdr'
  @ftp_library.clean_local_directory temp_folder
  @ftp.sync_recent_receipts 'Receipts/MetadataReceipts', temp_folder
  receipts = Dir.glob("#{temp_folder}/*.xml")

  raise 'error - no metadata receipts found' if receipts.empty?

  receipts.each do |r|
    xml = Nokogiri::XML(File.open(r))
    puts xml.at_css("//FaultMessage").content if xml.at_css('Success').content == 'false'
    #found == true if (xml.at_css('Success').content) == 'true'
    #(xml.at_css('EpisodeTitle').content) == @uuid
  end
end
