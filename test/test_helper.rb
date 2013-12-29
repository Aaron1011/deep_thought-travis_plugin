$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['RACK_ENV'] = 'test'
ENV['SESSION_SECRET'] = 'secret'

require 'deep_thought'
require 'deep_thought-travis_plugin'
require 'rubygems'
require 'fileutils'
gem 'minitest'
require 'minitest/autorun'
require 'mocha/setup'
require 'database_cleaner'

begin; require 'turn/autorun'; rescue LoadError; end

DeepThought.setup(ENV)

DatabaseCleaner.clean_with(:truncation)
DatabaseCleaner.strategy = :transaction

BCrypt::Engine.cost = BCrypt::Engine::MIN_COST
