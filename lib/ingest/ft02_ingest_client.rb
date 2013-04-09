$:.unshift(File.dirname(__FILE__))
require 'ingest_helper'
require 'bundler/setup'
require 'ingestrb'
require 'json'

opts = {
    :ftp_host => '10.210.177.12',
    :ftp_user => 'ITVFT02\Mercuryftp',
    :ftp_password => '45wNy36v',
    :edgeserver_ftp_host => 'itvandroid.upload.akamai.com',
    :edgeserver_ftp_user => 'stgsyndicationaccess',
    :edgeserver_ftp_password => 'aCeAbTHUpgY5',
    :receipt_wait => 20,
    :receipt_retry_attempts => 20,
    :receipt_search_mins => 10
}

p IngestHelper.new.do_ingest(opts, '183124', true)
