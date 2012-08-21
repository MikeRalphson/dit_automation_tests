$:.unshift(File.dirname(__FILE__) + 'lib')
require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'set'
require 'nokogiri'


Cucumber::Rake::Task.new(:run) do |task|
  task.cucumber_opts = %w(--format pretty)
  task.cucumber_opts = "-I lib"
  #t.libs << 'lib'
  task.cucumber_opts = "-t ~@wip"
end

Cucumber::Rake::Task.new(:run_wip) do |task|
  task.cucumber_opts = %w(--format pretty)
  task.cucumber_opts = "-t @wip"
end