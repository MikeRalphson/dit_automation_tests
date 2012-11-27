require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helper'

client = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'CatchUpAndArchive/MetadataFromSyndication'
  config.asset_destination = 'CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = 'Receipts/MetadataReceipts'
  config.asset_receipt_location = 'Receipts/ITV/Dotcom'
  config.receipt_wait = 20
  config.receipt_retry_attempts = 20
  config.receipt_search_mins = 10
  config.ftp_host = 'S01-ITVONLINEFTP.ITV.COM'
  config.ftp_user = 'mercuryftp'
  config.ftp_password = '9d$]q1H&g+\>'
  config.edgeserver_ftp_host = 'itvandroid.upload.akamai.com'
  config.edgeserver_ftp_user = 'stgsyndicationaccess'
  config.edgeserver_ftp_password = 'aCeAbTHUpgY5'
end

p IngestHelper.new.do_ingest(client, :s01, '183125', true, true)
