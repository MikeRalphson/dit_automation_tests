require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:run) do |task|
  task.cucumber_opts = %w(--format pretty)
  task.cucumber_opts = "-t ~@wip"
end

Cucumber::Rake::Task.new(:run_wip) do |task|
  task.cucumber_opts = %w(--format pretty)
  task.cucumber_opts = "-t @wip"
end