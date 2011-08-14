require 'rake'
require 'rspec/core/rake_task'
require "bundler/gem_tasks"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format', 'progress' ]
end

desc "Run all specs with RCov"
RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.rcov_opts = ['--text-report', '--save', 'coverage.info', '--exclude', 'spec_helper', '--exclude', '^/']
end

task :default => [:spec]

