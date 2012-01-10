require 'bundler/gem_tasks'
require 'rake/clean'
require 'rdiscount'
require 'rocco/tasks'
Rocco::make 'docs/'

desc 'Build rocco docs'
task :docs => :rocco
directory 'docs/'
# Alias for docs task
task :doc => :docs

desc 'Build docs and open in browser for the reading'
task :read => :docs do
  sh 'open docs/lib/chef-extensions.html'
end

# Make index.html a copy of chef-extensions.html
file 'docs/index.html' => 'docs/lib/chef-extensions.html' do |f|
  cp 'docs/lib/chef-extensions.html', 'docs/index.html', :preserve => true
end
task :docs => 'docs/index.html'
CLEAN.include 'docs/index.html'

# Update the pages/ directory clone
file 'docs/.git' => ['docs/', '.git/refs/heads/gh-pages'] do |f|
  sh "cd docs && git init -q && git remote add o ../.git" if !File.exist?(f.name)
  sh "cd docs && git fetch -q o && git reset -q --hard o/gh-pages && touch ."
end
CLOBBER.include 'docs/.git'

# GITHUB PAGES ===============================================================

desc 'Update gh-pages branch'
task :pages => ['docs/.git', :docs] do
  rev = `git rev-parse --short HEAD`.strip
  Dir.chdir 'docs' do
    sh "git add *.html"
    sh "git commit -m 'rebuild pages from #{rev}'" do |ok,res|
      if ok
        verbose { puts "gh-pages updated" }
        sh "git push -q o HEAD:gh-pages"
      end
    end
  end
end
