require 'bundler/setup'
require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'rspec/core/rake_task'

desc 'Run all stable tests (default)'
Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = '-p default'
end

desc 'Run stable RC3 tests'
Cucumber::Rake::Task.new(:rc3) do |task|
  task.cucumber_opts = '-p rc3'
end

desc 'Run stable Test (FT02) tests'
Cucumber::Rake::Task.new(:test) do |task|
  task.cucumber_opts = '-p test'
end

Cucumber::Rake::Task.new(:local) do |task|
  task.cucumber_opts = '-p local'
end

Cucumber::Rake::Task.new(:sanity) do |task|
  task.cucumber_opts = '-p sanity'
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = '-p wip'
end

Cucumber::Rake::Task.new(:bug) do |task|
  task.cucumber_opts = '-p bug'
end

Cucumber::Rake::Task.new(:android) do |task|
  task.cucumber_opts = '-p android'
end

Cucumber::Rake::Task.new(:broadcaster) do |task|
  task.cucumber_opts = '-p broadcaster'
end

Cucumber::Rake::Task.new(:geo) do |task|
  task.cucumber_opts = '-p geo'
end

Cucumber::Rake::Task.new(:stings) do |task|
  task.cucumber_opts = '-p stings'
end

task :local_ingest do
  $:.unshift(File.dirname(__FILE__) + '/lib')
  require 'ingest/local_ingest_client'
end

RSpec::Core::RakeTask.new(:spec)

task :default => :cucumber
