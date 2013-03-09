require 'mongoid'

class Dictionary 
  include Mongoid::Document

  field :word, type: String
end
