require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "minitest/testtask"


RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*_spec.rb'
    t.libs.push 'spec'
end

Rake::TestTask.new do |t|
    t.pattern = 'test/**/*_test.rb'
    t.libs.push 'test'
end
