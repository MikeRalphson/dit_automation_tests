require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'set'
require 'nokogiri'

Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = "-f pretty -t ~@wip -t ~@not_implemented -t ~@manual"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip)
end

Cucumber::Rake::Task.new(:playlist) do |task|
  task.cucumber_opts = %w(-f pretty -t @playlist)
end

task :default => :cucumber
