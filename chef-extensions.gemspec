# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "chef-extensions/version"

Gem::Specification.new do |s|
  s.name        = "chef-extensions"
  s.version     = Chef::Extensions::VERSION
  s.authors     = ["Gerhard Lazu"]
  s.email       = ["gerhard@lazu.co.uk"]
  s.homepage    = "http://gchef.github.com/chef-extensions"
  s.summary     = %q{Chef extensions, can be used stand-alone}
  s.description = %q{Commands useful for checking internet connectivity, VM presence etc.}

  s.rubyforge_project = "chef-extensions"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "chef"
  s.add_development_dependency 'guard-minitest'
  s.add_development_dependency "guard-rocco"
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'pry'
  s.add_development_dependency "rdiscount"
  s.add_development_dependency "rocco"
  s.add_development_dependency 'turn'
end
