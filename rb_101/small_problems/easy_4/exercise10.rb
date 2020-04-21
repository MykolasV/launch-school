DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def add_integer_sign!(result, negative)
  negative ? result.prepend('-') : result.prepend('+')
end

def signed_integer_to_string(number)
  return DIGITS[0] if number == 0

  negative = number < 0
  number *= -1 if negative

  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end

  result = add_integer_sign!(result, negative)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
puts '-----'

# Further exploration:

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  return '0' if number == 0
  sign = number < 0 ? '-' : '+'
  number = number * -1 if number < 0
  integer_to_string(number).prepend(sign)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
