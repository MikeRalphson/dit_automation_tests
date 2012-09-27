require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'

Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@not_implemented -t ~@manual"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip)
end

Cucumber::Rake::Task.new(:playlist) do |task|
  task.cucumber_opts = %w(-f pretty -t @playlist)
end

Cucumber::Rake::Task.new(:todo) do |task|
  task.cucumber_opts = %w(-f pretty -t @not_implemented)
end

task :default => :cucumber
