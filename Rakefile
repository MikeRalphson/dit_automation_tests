$:.unshift(File.dirname(__FILE__) + 'lib')
require 'cucumber/rake/task'
require 'cucumber/formatter/unicode'
require 'set'
require 'nokogiri'

Cucumber::Rake::Task.new do |task|
  task.cucumber_opts = %w(--format pretty --tags ~@wip --tags ~@not_implemented --tags ~@manual)
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = %w(--format pretty --tags @wip)
end

task :default => :cucumber
