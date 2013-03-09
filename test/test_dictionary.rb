require 'helper'
require 'dictionary'

describe Dictionary do

  before do
    %w[sure right that is not how you write it I see still wrong].each do |word|
      Dictionary.create(word: word).save
    end
  end

  after do
    Dictionary.destroy_all
  end

  it "should be able to verify that word exists" do
    queried_word = Dictionary.find_by(word: 'right')
    queried_word.word.must_equal 'right'
  end
end
