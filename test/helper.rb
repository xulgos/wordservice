ENV['RACK_ENV'] = 'test'
gem 'minitest'
require 'sinatra'
require 'minitest/autorun'
require 'rack/test'
require 'mongoid'

include Rack::Test::Methods
def app
  WordResource
end

Mongoid.sessions = {default: {hosts: ['localhost:27017'], database: 'test'}}
