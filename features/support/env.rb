require 'simplecov'
require 'yaml'

SimpleCov.start

config = YAML::load(File.read(File.dirname(__FILE__) + '/../../config.yml'))

case ENV['environment'] ||= 's01'
  when 'rc2'
    config.each { |k, v| v.each_pair { |x, y| ENV["#{x}"] = y } if k == 'rc2' }
  when 'rc3'
    config.each { |k, v| v.each_pair { |x, y| ENV["#{x}"] = y } if k == 'rc3' }
  when 'rcx'
    config.each { |k, v| v.each_pair { |x, y| ENV["#{x}"] = y } if k == 'rcx' }
  when 's01'
    config.each { |k, v| v.each_pair { |x, y| ENV["#{x}"] = y } if k == 's01' }
  when 'i01'
    config.each { |k, v| v.each_pair { |x, y| ENV["#{x}"] = y } if k == 'i01' }
  when 'live'
    config.each { |k, v| v.each_pair { |x, y| ENV["#{x}"] = y } if k == 'live' }
  else
    raise "error loading the requested environment: #{ENV["environment"]}"
end
