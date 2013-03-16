require 'sinatra/base'
require 'json'

class WordResource < Sinatra::Base

  def initialize(word_smugler)
    @word_smugler = word_smugler
  end

  get '/word' do
    result = {word: @word_smugler.random}
    JSON.generate(result)
  end
end
