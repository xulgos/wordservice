require 'minitest/autorun'
require 'dictionary'

describe Dictionary do

  before do
    @file = File.open('dictionaries/en_US.dic')
    @dictonary = Dictionary.new(@file)
  end

  after do
    @file.close
  end

  it "should be able to verify that word exists" do
    @dictonary.must_include('dictonary')
  end
end
