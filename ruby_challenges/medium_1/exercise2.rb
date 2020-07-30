class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    result = @number.digits.map.with_index do |number, index|
      if index.odd?
        new_number = number * 2
        new_number >= 10 ? (new_number - 9) : new_number
      else
        number
      end
    end

    result.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    return number if new(number).valid?

    digits = number.digits.reverse
    [*0..9].each do |addition|
      digits << addition
      break if new(digits.join.to_i).valid?
      digits.pop
    end

    digits.join.to_i
  end
end

# Given solution

class Luhn
  def initialize(number)
    @digits = number.to_s.split('').map(&:to_i)
  end

  def number
    @digits.map(&:to_s).join.to_i
  end

  def addends
    @digits.reverse.each_with_index.map do |digit, index|
      if index.even?
        digit
      else
        digit * 2 > 10 ? digit * 2 - 9 : digit * 2
      end
    end.reverse
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    new_base_number = number * 10
    if new(new_base_number).valid?
      new_base_number
    else
      luhn_remainder = new(new_base_number).checksum % 10
      new_base_number + (10 - luhn_remainder)
    end
  end
end
