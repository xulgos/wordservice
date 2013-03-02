ENV['RACK_ENV'] = 'test'
gem 'minitest'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods
def app
  WordResource
end
