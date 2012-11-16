require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helpers'

json = IngestHelpers.json_from_file("#{File.dirname(__FILE__) }/data.json")

host = IngestHelpers.get_host

json[host] = IngestHelpers.template unless json[host]

i01_hds_client = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'CatchUpAndArchive/MetadataFromSyndicationToBeEnhanced'
  config.asset_destination = 'CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = 'Receipts/Irdeto/Metadata'
  config.asset_receipt_location = 'Receipts/Irdeto/Assets'
  config.receipt_wait = 20
  config.receipt_retry_attempts = 20
  config.receipt_search_mins = 10
  config.irdeto = true
  config.hds = true
  config.ftp_host = '10.210.161.53'
  config.ftp_user = 'ITVINT01\Mercuryftp'
  config.ftp_password = '2Vkb1xpa'
end

i01 = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'CatchUpAndArchive/MetadataFromSyndication'
  config.asset_destination = 'CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = 'Receipts/MetadataReceipts'
  config.asset_receipt_location = 'Receipts/ITV/Dotcom'
  config.platforms = [:dotcom]
  config.irdeto = false
  config.hds = false
  config.android = false
  config.ftp_host = '10.210.161.53'
  config.ftp_user = 'ITVINT01\Mercuryftp'
  config.ftp_password = '2Vkb1xpa'
  config.edgeserver_ftp_host = 'itvandroid.upload.akamai.com'
  config.edgeserver_ftp_user = 'stgsyndicationaccess'
  config.edgeserver_ftp_password = 'aCeAbTHUpgY5'
  config.receipt_wait = 20
  config.receipt_retry_attempts = 20
  config.receipt_search_mins = 10
end

#DotCom
p result = i01.ingest
json[host]['dotcom'] = { i01.prodid => result }

#Mobile
i01.platforms = [:mobile]
i01.source = "#{File.dirname(__FILE__) }/assets/mobileassets"
i01.asset_receipt_location = 'Receipts/ITV/Mobile'
p result = i01.ingest
json[host]['mobile'] = { i01.prodid => result }

#Samsung
i01.platforms = [:samsung]
i01.source = "#{File.dirname(__FILE__) }/assets/samsung"
i01.asset_receipt_location = 'Receipts/ITV/Samsung'
p result = i01.ingest
json[host]['samsung'] = { i01.prodid => result }

#PS3
i01.platforms = [:ps3]
i01.source = "#{File.dirname(__FILE__) }/assets/ps3assets"
i01.asset_receipt_location = 'Receipts/ITV/PS3'
p result = i01.ingest
json[host]['ps3'] = { i01.prodid => result }

#Android
i01.android = true
i01.platforms = [:android]
i01.source = "#{File.dirname(__FILE__) }/assets/android"
i01.asset_destination = '/183124/priority/test'
p result = i01.ingest
i01.android = false #Fix having to do this
json[host]['android'] = { i01.prodid => result }

#YouView 
i01.asset_extensions = ['ts']
i01.platforms = [:youview]
i01.source = "#{File.dirname(__FILE__) }/assets/youview"
i01.asset_destination = 'CatchUpAndArchive/Assets/YouView'
i01.asset_receipt_location = 'Receipts/ITV/YouView'
p result = i01.ingest
json[host]['youview'] = { i01.prodid => result }

#Freesat
i01.asset_extensions = ['ts']
i01.platforms = [:freesat]
i01.source = "#{File.dirname(__FILE__) }/assets/freesat"
i01.asset_destination = 'CatchUpAndArchive/Assets/Freesat'
i01.asset_receipt_location = 'Receipts/ITV/Freesat'
p result = i01.ingest
json[host]['freesat'] = { i01.prodid => result }

#DotCom - HDS
p result = i01_hds_client.ingest
json[host]['mobile'] = { i01_hds_client.prodid => result }

p "results..."
p json

IngestHelpers.write_json("#{File.dirname(__FILE__) }/data.json", json)
