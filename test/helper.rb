ENV['RACK_ENV'] = 'test'
gem 'minitest'
require 'minitest/autorun'
require 'rack/test'
require 'mongoid'

include Rack::Test::Methods
Mongoid.sessions = {default: {hosts: ['localhost:27017'], database: 'wordservice'}}
