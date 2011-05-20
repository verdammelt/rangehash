# begin
#   require 'spec'
# rescue LoadError
#   require 'rubygems' unless ENV['NO_RUBYGEMS']
#   require 'spec'
# end
begin
  require 'rspec/core/rake_task'
rescue LoadError
  puts <<-EOS
To use rspec for testing you must install rspec gem:
    gem install rspec
EOS
  exit(0)
end

desc "Run the specs under spec/models"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--colour', '--format', 'd']
  t.ruby_opts = ['-w']
end

require 'rake'
require 'rspec/core/rake_task'

remove_task :rcov

desc "Run all specs with RCov"
RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.rcov_opts = ['--text-report', '--save', 'coverage.info', '--exclude', 'spec_helper', '--exclude', '^/']
end
