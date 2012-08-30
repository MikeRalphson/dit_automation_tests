require 'uri'
require 'open-uri'
require 'net/ftp'


Given /^I have valid metadata and assets for (\w+)$/ do |platfrom| 
end

When /^the Metadata and video assets have been sent to the correct folder in Biztalk$/ do

uri = URI.parse('ftp://mercuryftp@S01-ITVONLINEFTP.ITV.COM')
Net::FTP.open(uri.host) do |ftp|
  begin
    ftp.login 'MercuryFTP', '9d$]q1H&g+\>'
    ftp.passive = true
    ftp.chdir('CatchUpAndArchive/MetadataFromSyndication')
    ftp.puttextfile('lib/assets/Test_2 Eps_0-9_ITV1_NONE-DotcomMetadata.xml')
    ftp.chdir('../Assets/Dotcom')
    ftp.puttextfile('lib/assets/test_400Converted.mp4')
    ftp.puttextfile('lib/assets/test_600Converted.mp4')
    ftp.puttextfile('lib/assets/test_800Converted.mp4')
    ftp.puttextfile('lib/assets/test_1200Converted.mp4')
    ftp.chdir('../../../Receipts/MetadataReceipts/')
    puts ftp.pwd  
    
  ensure
    ftp.close
  end
  
  sleep 7
  #This has been added until we find a better way of checking the the file is present on the FTP server. 
 end
  
end


Then /^BizTalk will generate a success receipt$/ do
  pending # express the regexp above with the code you wish you had
end