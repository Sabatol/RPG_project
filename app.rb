require 'bundler'
Bundler.require
require 'pry'
$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'base_player'
require 'game'
require 'human_player'
require 'monster_player'
require 'router'
require 'view'

#####################################################

Router.new.perform