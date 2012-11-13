require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helpers'

json = IngestHelpers.json_from_file("#{File.dirname(__FILE__) }/data.json")

host = IngestHelpers.get_host

json[host] = IngestHelpers.template unless json[host]

rc3 = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'MercuryFTP/CatchUpAndArchive/MetadataFromSyndication'
  config.asset_destination = 'MercuryFTP/CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = '/MercuryFTP/Receipts/MetadataReceipts'
  config.asset_receipt_location = '/MercuryFTP/Receipts/ITV/Dotcom'
  config.platforms = [:dotcom]
  config.irdeto = false
  config.hds = false
  config.android = false
  config.ftp_host = '89.151.100.137'
  config.ftp_user = 'itvbbrc3/mercuryftp'
  config.ftp_password = 'Password01'
  config.edgeserver_ftp_host = 'itvandroid.upload.akamai.com'
  config.edgeserver_ftp_user = 'stgsyndicationaccess'
  config.edgeserver_ftp_password = 'aCeAbTHUpgY5'
  config.receipt_wait = 20
  config.receipt_retry_attempts = 20
  config.receipt_search_mins = 10
end

#DotCom
p result = rc3.ingest
json[host]['dotcom'] = { rc3.prodid => result }

#Mobile
rc3.platforms = [:mobile]
rc3.source = "#{File.dirname(__FILE__) }/assets/mobileassets"
rc3.asset_receipt_location = '/MercuryFTP/Receipts/ITV/Mobile'
p result = rc3.ingest
json[host]['mobile'] = { rc3.prodid => result }

#Samsung
rc3.platforms = [:samsung]
rc3.source = "#{File.dirname(__FILE__) }/assets/samsung"
rc3.asset_receipt_location = '/MercuryFTP/Receipts/ITV/Samsung'
p result = rc3.ingest
json[host]['samsung'] = { rc3.prodid => result }

#PS3
rc3.platforms = [:ps3]
rc3.source = "#{File.dirname(__FILE__) }/assets/ps3assets"
rc3.asset_receipt_location = '/MercuryFTP/Receipts/ITV/PS3'
p result = rc3.ingest
json[host]['ps3'] = { rc3.prodid => result }

#Android
rc3.android = true
rc3.platforms = [:android]
rc3.source = "#{File.dirname(__FILE__) }/assets/android"
rc3.asset_destination = '/185957/priority/test'
p result = rc3.ingest
rc3.android = false #Fix having to do this
json[host]['android'] = { rc3.prodid => result }

#YouView 
rc3.asset_extensions = ['ts']
rc3.platforms = [:youview]
rc3.source = "#{File.dirname(__FILE__) }/assets/youview"
rc3.asset_destination = 'MercuryFTP/CatchUpAndArchive/Assets/YouView'
rc3.asset_receipt_location = '/MercuryFTP/Receipts/ITV/YouView'
p result = rc3.ingest
json[host]['youview'] = { rc3.prodid => result }

#Freesat
rc3.asset_extensions = ['ts']
rc3.platforms = [:freesat]
rc3.source = "#{File.dirname(__FILE__) }/assets/freesat"
rc3.asset_destination = 'MercuryFTP/CatchUpAndArchive/Assets/Freesat'
rc3.asset_receipt_location = '/MercuryFTP/Receipts/ITV/Freesat'
p result = rc3.ingest
json[host]['freesat'] = { rc3.prodid => result }

p "results..."
p json

IngestHelpers.write_json("#{File.dirname(__FILE__) }/data.json", json)
