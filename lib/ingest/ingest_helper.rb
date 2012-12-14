class IngestHelper

  attr_reader :json

  def setup_json_data
    @file = 'data.json'
    @json = json_from_file("#{File.dirname(__FILE__) }/#{@file}")
    @host = get_host
    @json[@host] = template unless @json[@host]
  end

  def do_ingest(client, environment, android_dir, irdeto = false)

    setup_json_data

    if environment == :rc3
      base_receipt_dir = 'MercuryFTP/Receipts'
      base_asset_dir = 'MercuryFTP/CatchUpAndArchive'
    else
      base_receipt_dir = 'Receipts'
      base_asset_dir = 'CatchUpAndArchive'
    end

    #DotCom
    p result = client.ingest
    @json[@host]['dotcom'] = { client.prodid => result }

    #Mobile
    client.platforms = [:mobile]
    p client.source = "#{File.dirname(__FILE__) }/assets/mobileassets"
    client.asset_receipt_location = "#{base_receipt_dir}/ITV/Mobile"
    p result = client.ingest
    @json[@host]['mobile'] = { client.prodid => result }

    #Samsung
    client.platforms = [:samsung]
    client.source = "#{File.dirname(__FILE__) }/assets/samsung"
    client.asset_receipt_location = "#{base_receipt_dir}/ITV/Samsung"
    p result = client.ingest
    @json[@host]['samsung'] = { client.prodid => result }

    #PS3
    client.platforms = [:ps3]
    client.source = "#{File.dirname(__FILE__) }/assets/ps3assets"
    client.asset_receipt_location = "#{base_receipt_dir}/ITV/PS3"
    p result = client.ingest
    @json[@host]['ps3'] = { client.prodid => result }

    #Android
    client.android = true
    client.platforms = [:android]
    client.source = "#{File.dirname(__FILE__) }/assets/android"
    client.asset_destination = "/#{android_dir}/priority/test"
    p result = client.ingest
    client.android = false #Fix having to do this
    @json[@host]['android'] = { client.prodid => result }

    #YouView 
    client.asset_extensions = ['ts']
    client.platforms = [:youview]
    client.source = "#{File.dirname(__FILE__) }/assets/youview"
    client.asset_destination = "#{base_asset_dir}/Assets/YouView"
    client.asset_receipt_location = "#{base_receipt_dir}/ITV/YouView"
    p result = client.ingest
    @json[@host]['youview'] = { client.prodid => result }

    #Freesat
    client.asset_extensions = ['ts']
    client.platforms = [:freesat]
    client.source = "#{File.dirname(__FILE__) }/assets/freesat"
    client.asset_destination = "#{base_asset_dir}/Assets/Freesat"
    client.asset_receipt_location = "#{base_receipt_dir}/ITV/Freesat"
    p result = client.ingest
    @json[@host]['freesat'] = { client.prodid => result }

    #DotCom - Irdeto RTMPE
    if irdeto
      client.prodid = nil
      client.irdeto = true
      client.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
      client.platforms = [:dotcom]
      client.asset_extensions = ['mp4']
      client.metadata_destination = "#{base_asset_dir}/MetadataFromSyndicationToBeEnhanced"
      client.asset_destination = "#{base_asset_dir}/Assets/Dotcom"
      client.metadata_receipt_location = "#{base_receipt_dir}/Irdeto/Metadata"
      client.asset_receipt_location = "#{base_receipt_dir}/Irdeto/Assets"
      p result = client.ingest
      @json[@host]['irdeto_catchup_rtmpe'] = { client.prodid => result }

      #TODO: enable once work on DN-245 has been completed
      #DotCom - Irdeto HDS
      #client.source = "#{File.dirname(__FILE__) }/assets/hdsassets"
      #client.prodid = nil
      #p result = client.ingest
      #@json[@host]['irdeto_catchup_hds'] = { client.prodid => result }
    end

    write_json("#{File.dirname(__FILE__) }/#{@file}", @json)

    @json[@host]
  end

  def json_from_file(path)
    f = File.open(path).read.to_s
    json = JSON.parse(f)
  end

  def template
    { "dotcom"=>"", "mobile"=>"",
      "samsung"=>"", "ps3"=>"",
      "youview"=>"", "freesat"=>"",
      "android"=>"", "irdeto_catchup_rtmpe"=>"",
      "irdeto_archive_hds"=>"" }
  end

  def get_host
    ENV['ITV_ENV'] || `hostname`.strip
  end

  def write_json(path, json)
    File.open(path, 'w') { |f| f. write(json.to_json) }
  end

end
