require 'rubygems'
require 'bundler'
Bundler.setup

require 'turn/autorun'
Turn.config.format = :pretty

require 'pry'

$:.push File.expand_path("../../lib", __FILE__)
