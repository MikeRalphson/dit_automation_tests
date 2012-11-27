require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helper'

client = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'MercuryFTP/CatchUpAndArchive/MetadataFromSyndication'
  config.asset_destination = 'MercuryFTP/CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = '/MercuryFTP/Receipts/MetadataReceipts'
  config.asset_receipt_location = '/MercuryFTP/Receipts/ITV/Dotcom'
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

p IngestHelper.new.do_ingest(client, :rc3, '185957', false, false)
