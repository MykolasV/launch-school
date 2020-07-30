class Scrabble
  LETTER_VALUES = { %w(a e i o u l n r s t) => 1, %w(d g) => 2,
                    %w(b c m p) => 3, %w(f h v w y) => 4, %w(k) => 5,
                    %w(j x) => 8, %w(q z) => 10 }

  def initialize(word)
    @word = word
  end

  def score
    total = 0
    return total unless valid_input?

    @word.each_char do |letter|
      LETTER_VALUES.each do |letters, value|
        total += (letters.include?(letter.downcase) ? value : 0)
      end
    end
    total
  end

  def valid_input?
    @word.is_a?(String)
  end

  def self.score(word)
    new(word).score
  end
end
