require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'rspec/core/rake_task'

Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@bug -t ~@not_live -t ~@broadcaster"
end

Cucumber::Rake::Task.new(:rc3) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@not_rc3 -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@bug -t ~@not_live -t ~@broadcaster"
end

Cucumber::Rake::Task.new(:dev) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@not_local -t ~@bug -t ~@not_live -t ~@broadcaster"
end

Cucumber::Rake::Task.new(:sanity) do |task|
  task.cucumber_opts = "-f junit -o log/ -t @sanity -t ~@android_ingest -t ~@flakey -t ~@manual -t ~@not_live -t ~@bug -t ~@not_live -t ~@broadcaster"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip -t ~@manual -t ~@bug -t ~@not_live)
end

Cucumber::Rake::Task.new(:bug) do |task|
  task.cucumber_opts = %w(-f pretty -t @bug -t ~@not_live)
end

Cucumber::Rake::Task.new(:android) do |task|
  task.cucumber_opts = %w(-f pretty -t @android_ingest -t ~@bug -t ~@not_live)
end

Cucumber::Rake::Task.new(:broadcaster) do |task|
  task.cucumber_opts = %w(-f pretty -t @broadcaster -t ~@bug -t ~@not_live)
end

Cucumber::Rake::Task.new(:geo) do |task|
  task.cucumber_opts = %w(-f pretty -t @geo -t ~@bug -t ~@not_live)
end

task :local_ingest do
  $:.unshift(File.dirname(__FILE__) + '/lib')
  require 'ingest/local_ingest_client'
end

RSpec::Core::RakeTask.new(:spec)

task :default => :cucumber
