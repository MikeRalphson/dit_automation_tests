class IngestHelper

  attr_reader :json

  def setup_json_data
    @file = 'data.json'
    @json = json_from_file("#{File.dirname(__FILE__) }/#{@file}")
    @host = get_host
    @json[@host] = template unless @json[@host]
  end

  def fresh_ingest(opts, key = nil)
    client = IngestRb::FTPClient.new(opts)
    puts result = client.ingest
    key ||= opts[:platform].to_s
    @json[@host][key] = {client.prodid => result}
    client.prodid
  end

  def do_ingest(opts, android_dir, irdeto = false)

    setup_json_data

    base_receipt_dir = 'Receipts'
    base_asset_dir = 'CatchUpAndArchive'

    #DotCom
    opts[:platform] = :dotcom
    opts[:source] = "#{File.dirname(__FILE__) }/assets/dotcomassets"
    opts[:metadata_destination] = "#{base_asset_dir}/Metadata"
    opts[:asset_destination] = "#{base_asset_dir}/Assets/Dotcom"
    opts[:metadata_receipt_location] = "#{base_receipt_dir}/MetadataReceipts"
    opts[:asset_receipt_location] = "#{base_receipt_dir}/ITV/Dotcom"
    prodid = fresh_ingest opts

    #Mobile
    opts[:prodid] = prodid
    opts[:platform] = :mobile
    opts[:source] = "#{File.dirname(__FILE__) }/assets/mobileassets"
    opts[:asset_receipt_location] = "#{base_receipt_dir}/ITV/Mobile"
    prodid = fresh_ingest opts

    #Samsung
    opts[:prodid] = prodid
    opts[:platform] = :samsung
    opts[:source] = "#{File.dirname(__FILE__) }/assets/samsung"
    opts[:asset_receipt_location] = "#{base_receipt_dir}/ITV/Samsung"
    prodid = fresh_ingest opts

    #PS3
    opts[:prodid] = prodid
    opts[:platform] = :ps3
    opts[:source] = "#{File.dirname(__FILE__) }/assets/ps3assets"
    opts[:asset_receipt_location] = "#{base_receipt_dir}/ITV/PS3"
    prodid = fresh_ingest opts

    #Android
    opts[:prodid] = prodid
    opts[:platform] = :android
    opts[:source] = "#{File.dirname(__FILE__) }/assets/android"
    opts[:asset_destination] = "/#{android_dir}/priority/test"
    prodid = fresh_ingest opts

    #YouView
    opts[:prodid] = prodid
    opts[:asset_extension] = 'ts'
    opts[:platform] = :youview
    opts[:source] = "#{File.dirname(__FILE__) }/assets/youview"
    opts[:asset_destination] = "#{base_asset_dir}/Assets/YouView"
    opts[:asset_receipt_location] = "#{base_receipt_dir}/ITV/YouView"
    prodid = fresh_ingest opts

    #Freesat
    opts[:prodid] = prodid
    opts[:asset_extension] = 'ts'
    opts[:platform] = :freesat
    opts[:source] = "#{File.dirname(__FILE__) }/assets/freesat"
    opts[:asset_destination] = "#{base_asset_dir}/Assets/Freesat"
    opts[:asset_receipt_location] = "#{base_receipt_dir}/ITV/Freesat"
    prodid = fresh_ingest opts

    #DotCom - Irdeto RTMPE
    if irdeto
      opts[:prodid] = nil
      opts[:irdeto] = true
      opts[:source] = "#{File.dirname(__FILE__) }/assets/dotcomassets"
      opts[:platform] = :dotcom
      opts[:asset_extension] = 'mp4'
      opts[:metadata_destination] = "#{base_asset_dir}/MetadataToBeEnhanced"
      opts[:asset_destination] = "#{base_asset_dir}/Assets/Dotcom"
      opts[:metadata_receipt_location] = "#{base_receipt_dir}/Irdeto/Metadata"
      opts[:asset_receipt_location] = "#{base_receipt_dir}/Irdeto/Assets"
      prodid = fresh_ingest(opts, 'irdeto_catchup_rtmpe')

      #TODO: enable once work on DN-245 has been completed
      #DotCom - Irdeto HDS
      #opts[:source] = "#{File.dirname(__FILE__) }/assets/hdsassets"
      #opts[:prodid] = nil
      #opts[:hds] = true #needs implementing in ingestrb
      #prodid = fresh_ingest(opts, 'irdeto_catchup_hds')
    end

    write_json("#{File.dirname(__FILE__) }/#{@file}", @json)

    @json[@host]
  end

  def json_from_file(path)
    f = File.open(path).read.to_s
    json = JSON.parse(f)
  end

  def template
    {'dotcom' => '', 'mobile' => '',
     'samsung' => '', 'ps3' => '',
     'youview' => '', 'freesat' => '',
     'android' => '', 'irdeto_catchup_rtmpe' => '',
     'irdeto_archive_hds' => ''}
  end

  def get_host
    ENV['ITV_ENV'] || `hostname`.strip
  end

  def write_json(path, json)
    File.open(path, 'w') { |f| f.write(json.to_json) }
  end

end
