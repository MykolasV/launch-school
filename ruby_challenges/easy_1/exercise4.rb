class Trinary
  BASE = 3
  INVALID = /[^012]/

  def initialize(input)
    @string_number = input
  end

  def to_decimal
    return 0 unless valid?

    @string_number.reverse
                  .chars
                  .map.with_index { |char, idx| char.to_i * 3**idx }
                  .sum
  end

  def valid?
    !@string_number.match?(INVALID)
  end
end
