require 'rubygems'
require 'bundler'
Bundler.setup

require 'minitest/autorun'

require 'pry'

$:.push File.expand_path("../../lib", __FILE__)
