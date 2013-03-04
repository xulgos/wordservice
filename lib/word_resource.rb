require 'sinatra/base'
require 'json'

class WordResource < Sinatra::Base

  get '/word' do
    words = %w[sure right that is not how you write it I see still wrong]
    JSON.generate({word: words.sample})
  end
end
