require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helpers'

json = IngestHelpers.json_from_file("#{File.dirname(__FILE__) }/data.json")

host = IngestHelpers.get_host

json[host] = IngestHelpers.template unless json[host]

s01_hds_client = IngestRb.client do |config|
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
  config.ftp_host = 'S01-ITVONLINEFTP.ITV.COM'
  config.ftp_user = 'mercuryftp'
  config.ftp_password = '9d$]q1H&g+\>'
end

s01_old_dotcom_client = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'CatchUpAndArchive/MetadataFromSyndication'
  config.asset_destination = 'CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = 'Receipts/MetadataReceipts'
  config.asset_receipt_location = 'Receipts/ITV/Dotcom'
  config.receipt_wait = 20
  config.receipt_retry_attempts = 20
  config.receipt_search_mins = 10
  config.irdeto = false
  config.platforms = [:dotcom]
  config.hds = false
  config.ftp_host = 'S01-ITVONLINEFTP.ITV.COM'
  config.ftp_user = 'mercuryftp'
  config.ftp_password = '9d$]q1H&g+\>'
end

#DotCom
p result = s01_old_dotcom_client.ingest
json[host]['dotcom'] = { s01_old_dotcom_client.prodid => result }

#Mobile
s01_old_dotcom_client.platforms = [:mobile]
s01_old_dotcom_client.source = "#{File.dirname(__FILE__) }/assets/mobileassets"
s01_old_dotcom_client.asset_receipt_location = '/Receipts/ITV/Mobile'
p result = s01_old_dotcom_client.ingest
json[host]['mobile'] = { s01_old_dotcom_client.prodid => result }

#Samsung
s01_old_dotcom_client.platforms = [:samsung]
s01_old_dotcom_client.source = "#{File.dirname(__FILE__) }/assets/samsung"
s01_old_dotcom_client.asset_receipt_location = '/Receipts/ITV/Samsung'
p result = s01_old_dotcom_client.ingest
json[host]['samsung'] = { s01_old_dotcom_client.prodid => result }

#PS3
s01_old_dotcom_client.platforms = [:ps3]
s01_old_dotcom_client.source = "#{File.dirname(__FILE__) }/assets/ps3assets"
s01_old_dotcom_client.asset_receipt_location = '/Receipts/ITV/PS3'
p result = s01_old_dotcom_client.ingest
json[host]['ps3'] = { s01_old_dotcom_client.prodid => result }

=begin
#Android - not yet on S01
s01_old_dotcom_client.prodid = prodid
s01_old_dotcom_client.android = true
s01_old_dotcom_client.platforms = [:android]
s01_old_dotcom_client.source = "#{File.dirname(__FILE__) }/assets/android"
results.push s01_old_dotcom_client.ingest
p results
s01_old_dotcom_client.android = false #Fix having to do this
=end

#YouView
s01_old_dotcom_client.asset_extensions = ['ts']
s01_old_dotcom_client.platforms = [:youview]
s01_old_dotcom_client.source = "#{File.dirname(__FILE__) }/assets/youview"
s01_old_dotcom_client.asset_destination = '/CatchUpAndArchive/Assets/Youview'
s01_old_dotcom_client.asset_receipt_location = '/Receipts/ITV/YouView'
p result = s01_old_dotcom_client.ingest
json[host]['youview'] = { s01_old_dotcom_client.prodid => result }

#Freesat
s01_old_dotcom_client.asset_extensions = ['ts']
s01_old_dotcom_client.platforms = [:freesat]
s01_old_dotcom_client.source = "#{File.dirname(__FILE__) }/assets/freesat"
s01_old_dotcom_client.asset_destination = '/CatchUpAndArchive/Assets/Freesat'
s01_old_dotcom_client.asset_receipt_location = '/Receipts/ITV/Freesat'
p result = s01_old_dotcom_client.ingest
json[host]['freesat'] = { s01_old_dotcom_client.prodid => result }

#DotCom - HDS
p result = s01_hds_client.ingest
json[host]['mobile'] = { s01_hds_client.prodid => result }

p "results..."
p json

IngestHelpers.write_json("#{File.dirname(__FILE__) }/data.json", json)
