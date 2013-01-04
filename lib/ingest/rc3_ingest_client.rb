require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helper'

opts = {
  :ftp_host => '89.151.100.137',
  :ftp_user => 'itvbbrc3/mercuryftp',
  :ftp_password => 'Password01',
  :edgeserver_ftp_host => 'itvandroid.upload.akamai.com',
  :edgeserver_ftp_user => 'stgsyndicationaccess',
  :edgeserver_ftp_password => 'aCeAbTHUpgY5',
  :receipt_wait => 20,
  :receipt_retry_attempts => 20,
  :receipt_search_mins => 10
}

p IngestHelper.new.do_ingest(opts, :rc3, '185957', false)
