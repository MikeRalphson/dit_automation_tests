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
require 'timeout'
require 'active_support/time'
require 'bundler/setup'
require 'base64'
require 'ingestrb'

# local libs
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_api'
require 'env_config'
require 'http_client'
require 'patches/string'

require 'mercury/mercury_request_logger'
require 'mercury/irdeto_encryption'
require 'mercury/request/request'
require 'mercury/request/freesat_request'
require 'mercury/response/response'
require 'mercury/response/freesat_response'
require 'mercury/response/mobile_response'

require 'platform/platform'
require 'platform/dotcom'
require 'platform/mobile'
require 'platform/android'
require 'platform/samsung'
require 'platform/ps3'
require 'platform/youview'
require 'platform/freesat'

include Retryable

SimpleCov.start

Before do
  @mercury_api = MercuryApi.new
  @uuid = SecureRandom.uuid
  @timeout = 300
end
