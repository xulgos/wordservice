require 'helper'
require 'wordsmugler'

describe WordSmugler do

  before do
    @smugler = WordSmugler.new
    TestHelpers::fill_word_collection
  end

  after do
    TestHelpers::clear_word_collection
  end

  describe "When calling random" do

    it "with no parameters returns a random word" do
      TestHelpers::has_seventy_percent_randomness(
        lambda { |results| results << @smugler.random },
        lambda { |word| word }
      )
    end
  end
end
