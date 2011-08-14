# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rangehash/version"

Gem::Specification.new do |s|
  s.name        = "RangeHash"
  s.version     = Rangehash::VERSION
  s.authors     = ["Mark Simpson"]
  s.email       = ["verdammelt@gmail.com"]
  s.license     = 'MIT'
  s.homepage    = "https://github.com/verdammelt/rangehash"
  s.summary     = %q{Subclass of Hash which allows Ranges as the keys}
  s.description = <<-EOF
    RangeHash subclasses Hash and adds functionality so that Ranges can 
    be the keys and values can be found by FixNums within those ranges.
  EOF

  s.rubyforge_project = "rangehash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rcov"
end
