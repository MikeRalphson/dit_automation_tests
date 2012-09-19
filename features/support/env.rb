# external libs
require 'simplecov'
require 'rspec-expectations'
require 'pp'
require 'open-uri'
require 'json'
require 'nokogiri'
require 'nokogiri/css'
require 'savon'
require 'net/http'
require 'net/ftp'
require 'set'
require 'securerandom'
require 'rest-client'

# local libs
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_playlist'
require 'mercury_api'
require 'env_config'
require 'ftp_library'
require 'xml_library'

SimpleCov.start

Before do
  @mercury_api = MercuryApi.new
  @mercury_playlist = MercuryPlaylist.new
  @ftp_library = FtpLibrary.new
  @xml_library = XmlLibrary.new
  @uuid = SecureRandom.uuid

  Savon.configure do |config|
    config.log = false
    HTTPI.log = false
    #config.log_level = :debug
    config.pretty_print_xml = true
  end
end
