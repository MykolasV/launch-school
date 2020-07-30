class PhoneNumber
  INVALID = '0000000000'

  def initialize(number)
    @number = number
  end

  def number
    valid? ? clear_number : INVALID
  end

  def clear_number
    number = @number.gsub(/\D/, '')
    number.size == 10 ? number : number[1..-1]
  end

  def area_code
    clear_number[0..2]
  end

  def prefix
    clear_number[3..5]
  end

  def line_number
    clear_number[6..9]
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line_number}"
  end

  def valid?
    @number.match?(/\A\D?1?\d{3}\D{0,2}\d{3}\D?\d{4}\z/)
  end
end
