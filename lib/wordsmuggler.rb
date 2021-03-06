require 'word'

class WordSmuggler

  def random
    word = word_within_range(Random.rand, 0.001) until word
    word.value
  end

  private
  def word_within_range(number, offset)
    Word.where(:random.gte => number,
               :random.lte => number + offset).min do |left, right|
      left.random <=> right.random
    end
  end
end
