require 'sinatra/base'
require 'sinatra/json'
require 'json'

class WordResource < Sinatra::Base
  helpers JSON::helpers

  def initialize(word_smugler)
    @word_smugler = word_smugler
  end

  get '/word' do
    json word: @word_smugler.random
  end

  get '/word/:anyword' do
    json word: @word_smugler.get(params[:anyword])
  end
end
