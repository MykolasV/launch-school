class Phrase
  def initialize(sentence)
    @sentence = sentence
    @words = sentence.scan(/\b\w+'?\w?\b/).map(&:downcase)
  end

  def word_count
    @words.uniq.each_with_object({}) do |word, hash|
      hash[word] = @words.count(word)
    end
  end
end
