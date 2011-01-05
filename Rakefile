# -*- coding: utf-8 -*-
require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/rangehash'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'rangehash' do
  self.developer 'Mark Simpson', 'verdammelt@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name
  self.test_globs         = ["spec/**/*_spec.rb"] #["test/**/test_*.rb", "spec/**/*_spec.rb"]
  self.extra_rdoc_files = ["README.rdoc"]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

require 'rake'
require 'rspec/core/rake_task'

remove_task :rcov

desc "Run all specs with RCov"
RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.rcov_opts = ['--text-report', '--save', 'coverage.info', '--exclude', 'spec_helper', '--exclude', '^/']
end
