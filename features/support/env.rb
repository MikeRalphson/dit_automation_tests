# external libs
require 'simplecov'
require 'rspec-expectations'
require 'pp'
require 'open-uri'
require 'json'
require 'nokogiri'
require 'savon'
require 'timeout'
require 'base64'
require 'ingestrb'
require 'httparty'
require 'digest/sha1'

# local libs
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'mercury_api'
require 'env_config'
require 'http_client'
require 'patches/string'
require 'helpers/simulcast'
require 'utils'

require 'mercury/mercury_request_logger'
require 'mercury/irdeto_encryption'
require 'mercury/request/request'
require 'mercury/request/freesat_request'
require 'mercury/response/response'
require 'mercury/response/freesat_response'
require 'mercury/response/youview_response'
require 'mercury/response/splunk'
require 'playlist_service/request/rest_request'
require 'playlist_service/response/rest_response'
require 'playlist_service/hmac_tokens'

require 'platform/platform'
require 'platform/dotcom'
require 'platform/mobile'
require 'platform/android'
require 'platform/samsung'
require 'platform/ps3'
require 'platform/youview'
require 'platform/freesat'
require 'platform/samsungtv'
require 'platform/nowtv'

include Retryable
include Helpers::Simulcast

SimpleCov.start

Before do
  @mercury_api = MercuryApi.new
end
