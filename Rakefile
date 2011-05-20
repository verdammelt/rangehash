# -*- coding: utf-8 -*-
require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/rangehash'

Hoe.plugin :newgem
Hoe.plugin :flay
Hoe.plugin :flog
Hoe.plugin :reek
Hoe.plugin :roodi

$hoe = Hoe.spec 'rangehash' do
  self.developer 'Mark Simpson', 'verdammelt@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name
  self.test_globs         = ["spec/**/*_spec.rb"]
  self.extra_rdoc_files = ["README.rdoc"]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }
