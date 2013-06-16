require 'bundler/setup'
require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'rspec/core/rake_task'

desc 'Run stable I01 tests'
Cucumber::Rake::Task.new(:i01) do |task|
  task.cucumber_opts = '-p i01 CONFIG=i01'
end

desc 'Run stable FT02 tests'
Cucumber::Rake::Task.new(:ft02) do |task|
  task.cucumber_opts = '-p ft02 CONFIG=ft02'
end

desc 'Run tests against a local Bloom environment'
Cucumber::Rake::Task.new(:local) do |task|
  task.cucumber_opts = '-p local'
end

desc 'Live Sanity Tests'
Cucumber::Rake::Task.new(:live) do |task|
  task.cucumber_opts = '-p live CONFIG=live'
end

desc 'Run broadcaster tests'
Cucumber::Rake::Task.new(:broadcaster) do |task|
  task.cucumber_opts = '-p broadcaster'
end

desc 'Run geolocation tests'
Cucumber::Rake::Task.new(:geo) do |task|
  task.cucumber_opts = '-p geo'
end

desc 'Run sting tests'
Cucumber::Rake::Task.new(:stings) do |task|
  task.cucumber_opts = '-p stings'
end

desc 'Do a local ingest'
task :local_ingest do
  $:.unshift(File.dirname(__FILE__) + '/lib')
  require 'ingest/local_ingest_client'
end

desc 'Run unit tests'
RSpec::Core::RakeTask.new(:spec)

task :default => :live
