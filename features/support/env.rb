$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'simplecov'
require 'rspec-expectations'
require 'mercury_playlist'
require 'pp'
require 'mercury_api'
require 'env_config'

SimpleCov.start

Before do
  @mercury_api = MercuryApi.new
  @mercury_playlist = MercuryPlaylist.new
end
