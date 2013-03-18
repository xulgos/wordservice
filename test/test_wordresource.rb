require 'helper'
require 'wordsmugler'
require 'wordresource'
require 'json'

describe WordResource do

  describe "When accessed with a get to /word" do

    before do
      @smugler = WordSmugler.new
      TestHelpers::fill_word_collection
    end

    after do
      TestHelpers::clear_word_collection
    end

    def app
      WordResource.new(@smugler)
    end

    def get_and_parse_response
      get '/word'
      JSON.parse(last_response.body)
    end

    it "won't return an empty response" do
      get '/word'
      last_response.must_be :ok?
      last_response.wont_be_empty
    end

    it "returns valid JSON" do 
      get_and_parse_response
    end

    it "returns a random word" do
      TestHelpers::has_seventy_percent_randomness(
        lambda { |results| results << get_and_parse_response },
        lambda { |result| result['word'] }
      )
    end
  end
end
