require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'set'
require 'nokogiri'

Cucumber::Rake::Task.new(:cucumber) do |task|
  environment = ARGV.last
  task.cucumber_opts = "-f pretty -p #{environment} -t ~@wip -t ~@not_implemented -t ~@manual"
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(-f pretty -t @wip)
end

task :default => :cucumber
