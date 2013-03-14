require 'json'
require 'rspec'
require 'savon'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'mercury/irdeto_encryption'
require 'mercury/mercury_playlist'
require 'platform/platform'
require 'platform/dotcom'
require 'platform/mobile'
require 'platform/android'
require 'platform/youview'
require 'platform/ps3'
require 'platform/samsung'
require 'platform/freesat'
require 'mercury_api'
require 'http_client'
require 'env_config'
