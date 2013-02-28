require 'helper'
require 'word_resource'

describe WordResource do
  it "should not return an empty response" do
    get '/word'
    last_response.must_be :ok?
    last_response.wont_be_empty
  end
  it "should return a random word" do
    get '/word'
  end
end
