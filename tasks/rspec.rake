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