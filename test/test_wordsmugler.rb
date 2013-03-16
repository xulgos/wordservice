require 'helper'
require 'wordsmugler'

describe WordSmugler do

  before do
    @smugler = WordSmugler.new
    File.open('test/test_words.txt') do |handle|
      handle.each do |word|
        Word.create(value: word.strip)
      end
    end
  end

  after do
    Word.collection.drop
  end

  describe "When calling random" do

    it "with no parameters returns a random word" do
      results = []
      count = Random.rand(5...50).times { results << @smugler.random }
      grouped_results = results.group_by { |word| word }
      grouped_results.count.must_be :>,count - 2
    end
  end
end
