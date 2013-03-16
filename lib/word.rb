require 'mongoid'

class Word
  include Mongoid::Document

  field :value, type: String
  field :random, type: Float

  before_create do |document|
    document.random = Random.rand
  end
end
