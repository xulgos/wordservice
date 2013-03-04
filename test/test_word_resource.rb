require 'helper'
require 'word_resource'
require 'json'

describe WordResource do

  it "should not return an empty response" do
    get '/word'
    last_response.must_be :ok?
    last_response.wont_be_empty
  end

  it "should return a random word" do
    results = []
    5.times do
      get '/word'
      results << JSON.parse(last_response.body)
    end
    grouped_results = results.group_by do |result|
      result['word']
    end
    grouped_results.length.must_be :>, 3
  end
end
