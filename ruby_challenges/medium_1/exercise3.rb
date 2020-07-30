class PigLatin
  def self.translate(string)
    array_of_words = string.split.map do |word|
      if word.match?(/\A[aeiou]/) || word.match(/\A(y|x)[^aeiou]/)
        word + 'ay'
      elsif word.match?(/\A[^aeiou]?qu?/)
        pattern = word.match(/\A[^aeiou]?qu?/)
        word.gsub(pattern.regexp, '') + pattern[0] + 'ay'
      elsif word.match?(/\A[^aeiou]/)
        pattern = word.match(/\A[^aeiou]+/)
        word.gsub(pattern.regexp, '') + pattern[0] + 'ay'
      end
    end

    array_of_words.join(' ')
  end
end

# Given solution

class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word + 'ay'
    else
      consonant_sound, the_rest_of_word = parse_for_consonant(word)
      the_rest_of_word + consonant_sound + 'ay'
    end
  end

  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.parse_for_consonant(word)
    consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [consonant_split[1], consonant_split[2]]
  end
end
