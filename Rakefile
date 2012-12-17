require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'rspec/core/rake_task'

desc "Run all stable tests (default)"
Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@bug"
end

desc "Run stable RC3 tests"
Cucumber::Rake::Task.new(:rc3) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@not_rc3 -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@bug -t ~@irdeto"
end

desc "Run stable Test (FT02) tests"
Cucumber::Rake::Task.new(:test) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@bug -t ~@irdeto"
end

Cucumber::Rake::Task.new(:dev) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@not_local -t ~@bug -t ~@broadcaster"
end

Cucumber::Rake::Task.new(:sanity) do |task|
  task.cucumber_opts = "-f junit -o log/ -t @sanity -t ~@android_ingest -t ~@flakey -t ~@manual -t ~@bug"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip -t ~@manual -t ~@bug)
end

Cucumber::Rake::Task.new(:bug) do |task|
  task.cucumber_opts = %w(-f pretty -t @bug)
end

Cucumber::Rake::Task.new(:android) do |task|
  task.cucumber_opts = %w(-f pretty -t @android_ingest -t ~@bug)
end

Cucumber::Rake::Task.new(:broadcaster) do |task|
  task.cucumber_opts = %w(-f pretty -t @broadcaster -t ~@bug)
end

Cucumber::Rake::Task.new(:geo) do |task|
  task.cucumber_opts = %w(-f pretty -t @geo -t ~@bug)
end

Cucumber::Rake::Task.new(:stings) do |task|
  task.cucumber_opts = %w(-f pretty -t @stings)
end

task :local_ingest do
  $:.unshift(File.dirname(__FILE__) + '/lib')
  require 'ingest/local_ingest_client'
end

RSpec::Core::RakeTask.new(:spec)

task :default => :cucumber
