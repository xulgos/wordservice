ENV['RACK_ENV'] = 'test'
gem 'minitest'
require 'minitest/autorun'
require 'rack/test'
require 'mongoid'

include Rack::Test::Methods
Mongoid.sessions = {default: {hosts: ['localhost:27017'], database: 'wordservice'}}

module TestHelpers

  def self.fill_word_collection
    File.open('test/test_words.txt') do |handle|
      handle.each do |word|
        Word.create(value: word.strip)
      end
    end
  end

  def self.clear_word_collection
    Word.collection.drop
  end

  def self.has_seventy_percent_randomness(random_method, grouping_method)
    results = []
    Random.rand(10...50).times { random_method.call(results) }
    grouped_results = results.group_by(&grouping_method)
    randomness = grouped_results.count/results.count.to_f
    randomness.must_be :>=,0.7
  end
end
