require 'rubygems'
require 'bundler'
Bundler.setup

begin
  require 'pry'
rescue LoadError
end

require 'turn/autorun'

$:.push File.expand_path("../../lib", __FILE__)
