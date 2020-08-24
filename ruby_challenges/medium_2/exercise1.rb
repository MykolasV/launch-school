class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes
  def initialize(factors)
    @max_factor = factors[:max_factor]
    @min_factor = factors[:min_factor]
    @min_factor ||= 1
    @all_palindromes = []
  end

  # rubocop: disable Metrics/MethodLength
  def generate
    palindromes_and_factors = {}

    @min_factor.upto(@max_factor) do |first_factor|
      first_factor.upto(@max_factor) do |second_factor|
        product = first_factor * second_factor
        factors = [first_factor, second_factor]

        if palindromes_and_factors.key?(product)
          palindromes_and_factors[product] << factors
        elsif palindrome?(product)
          palindromes_and_factors[product] = [factors]
        end
      end

      palindromes_and_factors.each do |number, factors|
        @all_palindromes << Palindrome.new(number, factors)
      end
    end
  end
  # rubocop: enable Metrics/MethodLength

  def smallest
    @all_palindromes.min_by(&:value)
  end

  def largest
    @all_palindromes.max_by(&:value)
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
