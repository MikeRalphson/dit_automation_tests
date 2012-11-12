require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'

Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey"
end

Cucumber::Rake::Task.new(:rc3) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@not_rc3 -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey"
end

Cucumber::Rake::Task.new(:sso) do |task|
  task.cucumber_opts = "-f junit -o log/ -t @sso -t ~@flakey -t ~@manual -t ~@android_ingest -t ~@wip"
end

Cucumber::Rake::Task.new(:dev) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey -t ~@not_local"
end

Cucumber::Rake::Task.new(:sanity) do |task|
  task.cucumber_opts = "-f junit -o log/ -t @sanity -t ~@android_ingest -t ~@flakey -t ~@manual -t ~@not_live"
end

Cucumber::Rake::Task.new(:report) do |task|
  task.cucumber_opts = "-f html -o results.htm -t ~@wip -t ~@manual -t ~@android_ingest -t ~@flakey"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip -t ~@manual)
end

Cucumber::Rake::Task.new(:android) do |task|
  task.cucumber_opts = %w(-f pretty -t @android_ingest)
end

task :default => :cucumber
