require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Rake::TaskManager.record_task_metadata = true

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
  task.cucumber_opts = '-p local CONFIG=local'
end

desc 'Live Sanity Tests'
Cucumber::Rake::Task.new(:live) do |task|
  task.cucumber_opts = '-p live CONFIG=live'
end

desc 'Run geolocation tests'
Cucumber::Rake::Task.new(:geo) do |task|
  task.cucumber_opts = '-p geo'
end

desc 'Run flakey tests'
Cucumber::Rake::Task.new(:flakey) do |task|
  task.cucumber_opts = '-p flakey'
end

desc 'Do a local ingest'
task :local_ingest do
  $:.unshift(File.dirname(__FILE__) + '/lib')
  require 'ingest/local_ingest_client'
end

desc 'Run unit tests'
RSpec::Core::RakeTask.new(:unit) do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.rspec_opts = '--profile  --color --tag ~wip --require helpers/spec_helper --format documentation'
end

task :default do
  puts 'No default task - run one of these instead:'
  Rake::application.options.show_tasks = :tasks
  Rake::application.options.show_task_pattern = //
  Rake::application.display_tasks_and_comments
end
