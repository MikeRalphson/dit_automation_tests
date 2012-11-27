$:.unshift(File.dirname(__FILE__))
require 'ingest_helper'
require 'bundler/setup'
require 'ingestrb'
require 'json'

client = IngestRb.client do |config|
  config.source = "#{File.dirname(__FILE__) }/assets/dotcomassets"
  config.metadata_destination = 'CatchUpAndArchive/MetadataFromSyndication'
  config.asset_destination = 'CatchUpAndArchive/Assets/Dotcom'
  config.metadata_receipt_location = 'Receipts/MetadataReceipts'
  config.asset_receipt_location = 'Receipts/ITV/Dotcom'
  config.ftp_host = '10.210.177.12'
  config.ftp_user = 'ITVFT02\Mercuryftp'
  config.ftp_password = '45wNy36v'
  config.edgeserver_ftp_host = 'itvandroid.upload.akamai.com'
  config.edgeserver_ftp_user = 'stgsyndicationaccess'
  config.edgeserver_ftp_password = 'aCeAbTHUpgY5'
  config.receipt_wait = 20
  config.receipt_retry_attempts = 20
  config.receipt_search_mins = 10
end

p IngestHelper.new.do_ingest(client, :ft02, '183124', true, true)

