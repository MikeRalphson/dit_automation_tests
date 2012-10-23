require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'

Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f junit -o log/ -t ~@wip -t ~@not_implemented -t ~@manual -t ~@android -t ~@flakey"
end

Cucumber::Rake::Task.new(:sanity) do |task|
  task.cucumber_opts = "-f junit -o log/ -t @sanity -t ~@android -t ~@flakey"
end

Cucumber::Rake::Task.new(:sso) do |task|
  task.cucumber_opts = "-f junit -o log/ -t @sanity -t @sso -t ~@android -t ~@flakey"
end

Cucumber::Rake::Task.new(:report) do |task|
  task.cucumber_opts = "-f html -o results.htm -t ~@wip -t ~@not_implemented -t ~@manual -t ~@android"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip -t ~@manual)
end

Cucumber::Rake::Task.new(:android) do |task|
  task.cucumber_opts = %w(-f pretty -t @android)
end

task :default => :cucumber
