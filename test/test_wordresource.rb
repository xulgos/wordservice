require 'helper'
require 'wordsmuggler'
require 'wordresource'
require 'json'

describe WordResource do

  before do
    @smuggler = WordSmuggler.new
    TestHelpers::fill_word_collection
  end

  after do
    TestHelpers::clear_word_collection
  end

  def app
    WordResource.new(@smuggler)
  end

  def get_and_parse_response(word=nil)
    get word ? "/word/#{word}" : '/word'
    JSON.parse(last_response.body)
  end

  describe "When accessed with a get to /word" do

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

  describe "When accessed with a get to /word/{anyword}" do

    it "returns a the resource of a given word" do
      word = get_and_parse_response('fog')
      word.value.must_equal('fog')
    end

    it "if the word does not exist it returns a 404" do
      get '/word/doesnotexist'
      last_response.status.must_equal 404
    end
  end
end
