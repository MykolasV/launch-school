class Octal
  BASE = 8
  INVALID = /\D|8|9/

  def initialize(input)
    @string_number = valid?(input) ? input : '0'
  end

  def to_decimal
    return 0 if @string_number == '0'

    decimal = 0
    nth = @string_number.size - 1
    @string_number.each_char do |str|
      decimal += str.to_i * (BASE**nth)
      nth -= 1
    end

    decimal
  end

  def valid?(input)
    return false if input.match?(INVALID)
    true
  end
end
