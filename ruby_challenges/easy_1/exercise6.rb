class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    possible_anagrams.select do |anagram|
      next if anagram.downcase == @word.downcase
      anagram.downcase.chars.sort == @word.downcase.chars.sort
    end
  end
end
