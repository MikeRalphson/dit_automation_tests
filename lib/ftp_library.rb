class FtpLibrary

  def create_ftp_connection(host, username, password)
    ftp = Net::FTP.new
    ftp.connect(host)
    ftp.login(username, password)
    ftp
  end

  def clean_local_directory(dir)
    Dir.foreach(dir) { |f| File.delete(File.join(dir, f)) unless f == '.' || f == '..' } if File.directory? dir
  end

end

module Net
  class FTP
    def sync_recent_receipts(remote_folder, local_folder, minutes_timespan)
      Dir.mkdir local_folder unless File.directory? local_folder
      remote_filenames = nlst(remote_folder)
      remote_filenames.each do |fn|
        receipt_date = (fn.match '\d{17}').to_s
        next if (receipt_date < minutes_timespan.minutes.ago.strftime("%Y%m%d%H%M%S%L"))
        fn.gsub!("\\", "/")
        fn.gsub!("Receipts/MetadataReceipts", "")

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
