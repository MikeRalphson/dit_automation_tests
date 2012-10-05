require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'

Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@not_implemented -t ~@manual -t ~@android"
end

Cucumber::Rake::Task.new(:sanity) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@not_implemented -t ~@manual -t ~@android -t ~@playlist"
end

Cucumber::Rake::Task.new(:report) do |task|
  task.cucumber_opts = "-f html -o results.htm -t ~@wip -t ~@not_implemented -t ~@manual -t ~@android"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip)
end

Cucumber::Rake::Task.new(:android) do |task|
  task.cucumber_opts = %w(-f pretty -t @android)
end

task :default => :cucumber
