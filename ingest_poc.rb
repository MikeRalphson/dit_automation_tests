require 'pp'
require 'net/ftp'
require 'timeout'
require 'rspec-expectations'
require 'securerandom'
require 'nokogiri'
require 'nokogiri/css'

def prepare_metadata(dir, metadata)
  @uuid = SecureRandom.uuid
  files = Dir.glob("#{dir}/*.xml")
  pp files

  files.each do |f|
    xml = Nokogiri::XML(File.open(f))
    title = xml.at_css "tva|Title"
    title.content = @uuid

    # write to a new file because ruby corrupts the original
    Dir.mkdir 'tmp' unless File.directory? 'tmp'
    outfile = File.new("tmp/metadatatest.xml", "w")
    outfile.puts xml.to_xml
    outfile.close
  end
end

# todo: improve
def manage_assets
  renditions = %w(test_rendition_400.mp4 test_rendition_600.mp4 test_rendition_800.mp4 test_rendition_1200.mp4)
  Dir.chdir 'lib/assets'
  @assets = []
  Dir.foreach(Dir.pwd) { |f| @assets << f if f.match '\.mp4$' }
  (@assets.sort).should == renditions.sort
  @metadata = File.open '../../tmp/metadatatest.xml'
end

def create_ftp_connection(host, username, password)
  ftp = Net::FTP.new
  ftp.connect(host)
  ftp.login(username, password)
  ftp
end

module Net
  class FTP
    def sync_remote_folder(remote_folder, local_folder)
      chdir '/' if pwd != '/'
      Dir.mkdir local_folder unless File.directory? local_folder
      remote_filenames = nlst(remote_folder)
      remote_filenames.each do |fn|
        receipt_date = (fn.match '\d{17}').to_s
        two_minutes = (DateTime.now - 0.00173).strftime("%Y%m%d%H%M%S%L")
        next if (receipt_date < two_minutes)

        # need an error if no suitable files to sync have been found
        local_filename = File.join(local_folder, fn)

        unless File.exists?(local_filename)
          puts "syncing file: #{fn}"
          remote_filename = File.join(remote_folder, fn)

          begin
            Timeout.timeout(5) { get(remote_filename, local_filename) }
          rescue => error
            puts error.message
            puts 'Download failed'
            if File.exists?(local_filename)
              File.delete local_filename
            end
          end
        end
      end
    end
  end
end

def ingest_assets(ftp, assets, metadata)
  begin
    ftp.chdir '/' if ftp.pwd != '/'

    puts 'serving metadata'
    ftp.chdir('CatchUpAndArchive/MetadataFromSyndication')
    ftp.put(metadata)

    puts 'serving assets'
    ftp.chdir('../Assets/Dotcom')
    assets.each { |f| ftp.put f }

    Timeout.timeout(20) { sleep 1 until (ftp.nlst(ftp.pwd).select { |f| f.match /test_rendition_\d+\.mp4/ }).empty? }
    puts 'files ingested!'
  rescue
    puts 'encountered error'
    ftp.close
  end
end

def clean_local_directory(dir)
  Dir.foreach(dir) { |f| File.delete(File.join(dir, f)) unless f == '.' || f == '..' } if File.directory? dir
end

def get_receipts(dir)
  Dir.glob("#{dir}/*.xml")
end


prepare_metadata 'lib/assets', 'test'
manage_assets
@ftp = create_ftp_connection 'S01-ITVONLINEFTP.ITV.COM', 'mercuryftp', '9d$]q1H&g+\>'
ingest_assets @ftp, @assets, @metadata
clean_local_directory "/tmp/mdr"

# sometimes too fast so wait for the receipts...
sleep 10
@ftp.sync_remote_folder("/Receipts/MetadataReceipts", "/tmp/mdr")

@ftp.close

@receipts = get_receipts '/tmp/mdr'

@receipts.each do |r|
  xml = Nokogiri::XML(File.open(r))
  (xml.at_css('EpisodeTitle').content).should == @uuid
  (xml.at_css('Success').content).should == 'true'
  #more...
end


puts 'successfully ingested :)'
