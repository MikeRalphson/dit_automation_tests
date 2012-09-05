require 'pp'
require 'net/ftp'
require 'timeout'
require 'rspec-expectations'
require 'rspec/matchers'
require 'rspec/expectations/extensions/array'

# todo: improve
def manage_assets
  renditions = %w(test_rendition_400.mp4 test_rendition_600.mp4 test_rendition_800.mp4 test_rendition_1200.mp4)
  Dir.chdir 'lib/assets'
  @assets = []
  Dir.foreach(Dir.pwd) { |f| @assets << f if f.match '\.mp4$' }
  (@assets.sort).should == renditions.sort
  @metadata = File.open 'DotcomMetadata.xml'
end

def create_ftp_connection(host, username, password)
  @ftp = Net::FTP.new
  @ftp.connect(host)
  @ftp.login(username, password)
end

def close_ftp_connection
  @ftp.close
end

module Net
  class FTP
    def sync_remote_folder(remote_folder, local_folder)
      chdir '/' if pwd != '/'
      Dir.mkdir local_folder unless File.directory? local_folder
      remote_filenames = nlst(remote_folder)
      remote_filenames.each do |fn|
        receipt_date = (fn.match '\d{17}').to_s
        fifteen_minutes = (DateTime.now - 0.0104).strftime("%Y%m%d%H%M%S%L")
        next if (receipt_date < fifteen_minutes)

        local_filename = File.join(local_folder, fn)

        unless File.exists?(local_filename)
          puts "syncing file: #{fn}"
          remote_filename = File.join(remote_folder, fn)

          begin
            Timeout.timeout(5) { get(remote_filename, local_filename) }
          rescue
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


manage_assets
create_ftp_connection 'S01-ITVONLINEFTP.ITV.COM', 'mercuryftp', '9d$]q1H&g+\>'
ingest_assets @ftp, @assets, @metadata

local_dir = "/tmp/mdr"
clean_local_directory local_dir
@ftp.sync_remote_folder("/Receipts/MetadataReceipts", local_dir)

close_ftp_connection

# now parse the receipts...

# will need to put a GUID/UUID into the metadata before ingestion and check afterwords
# success should == true
# check production id / programmeTitle / seriesTitle ?
