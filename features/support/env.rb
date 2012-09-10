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

# local libs
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_playlist'
require 'mercury_api'
require 'env_config'
require 'ftp_library'

SimpleCov.start

Before do
  @mercury_api = MercuryApi.new
  @mercury_playlist = MercuryPlaylist.new
  @ftp_library = FtpLibrary.new

  Savon.configure do |config|
    config.log = false
    HTTPI.log = false
    #config.log_level = :debug
    config.pretty_print_xml = true
  end
end
