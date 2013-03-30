require 'helper'
require 'wordsmuggler'

describe WordSmuggler do

  before do
    @smuggler = WordSmuggler.new
    TestHelpers::fill_word_collection
  end

  after do
    TestHelpers::clear_word_collection
  end

  describe "When calling random" do

    it "with no parameters returns a random word" do
      TestHelpers::has_seventy_percent_randomness(
        lambda { |results| results << @smuggler.random },
        lambda { |word| word }
      )
    end
  end
end
