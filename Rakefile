require 'bundler/gem_tasks'

require 'rake/clean'
require 'rake/testtask'

require 'rdiscount'
require 'rocco/tasks'
Rocco::make 'gh-pages/'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

task :default => [:test]



### DOCUMENTATION

desc 'Build rocco gh-pages'
task :docs => :rocco do
  %x{
    cd gh-pages;
    mv lib/* .;
    rm -fr lib;
    cp chef-extensions.html index.html
  }
end
# Aliases for docs task
task :doc => :docs
task :generate => :docs

desc 'Build docs and open in browser for the reading'
task :read => :docs do
  sh 'open gh-pages/index.html'
end
