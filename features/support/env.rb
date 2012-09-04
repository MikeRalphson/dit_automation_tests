$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'simplecov'
require 'rspec-expectations'
require 'mercury_playlist'
require 'pp'
require 'mercury_api'
require 'env_config'
require 'open-uri'
require 'json'
require 'nokogiri'
require 'nokogiri/css'
require 'savon'
require 'net/http'


SimpleCov.start

Before do
  @mercury_api = MercuryApi.new
  @mercury_playlist = MercuryPlaylist.new

  Savon.configure do |config|
    config.log = false
    HTTPI.log = false
    #config.log_level = :debug
    config.pretty_print_xml = true
  end
end
