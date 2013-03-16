require 'helper'
require 'minitest/unit'
require 'wordsmugler'
require 'word_resource'
require 'json'

describe WordResource do

  describe "When accessed with a get to /word" do

    before do
      @smugler = WordSmugler.new
    end

    def app
      WordResource.new(@smugler)
    end

    def get_and_parse_response
      get '/word'
      JSON.parse(last_response.body)
    end

    it "won't return an empty response" do
      skip
      get '/word'
      last_response.must_be :ok?
      last_response.wont_be_empty
    end

    it "returns valid JSON" do 
      skip
      get_and_parse_response
    end

    it "returns a random word" do
      skip
      results = []
      5.times { results << get_and_parse_response }
      grouped_results = results.group_by { |result| result['word'] }
      grouped_results.length.must_be :>, 3
    end
  end
end
