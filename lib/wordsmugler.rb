require 'word'

class WordSmugler

  def random
    random_key = Random.rand
    word = Word.where(:random.gte => random_key).first
    word.value
  end
end
