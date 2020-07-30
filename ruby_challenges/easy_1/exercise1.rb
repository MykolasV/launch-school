class Series
  def initialize(string)
    @string = string
    @digits = string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @digits.size

    result = []
    0.upto(@digits.size - length) do |index|
      result << @digits[index, length]
    end

    result
  end

end
