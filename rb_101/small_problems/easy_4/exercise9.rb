INTEGER_TO_STRING = {
  0 => '0', 1 => '1', 2 => '2',
  3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8',
  9 => '9'
}

def integer_to_string(number)
  numbers = number.digits.reverse
  result = ''

  numbers.each { |num| result += INTEGER_TO_STRING[num] }

  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
puts '-----'

# Provided solution:

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further exploration:

# Mutating String methods that don't end with '!':
#   []= ; << ; clear ; concat ; freeze ; insert ; prepend ; replace.
# All of the ones with '!' have a non-mutating form without '!'.

# Array methods follow the same pattern except method sort_by! which is a
# mutating method but doesn't have a non-mutating form without '!'.

# Hash follows a similar pattern but is different as it has quite a few mutating
# methods like delete, delete_if, keep_if, rehash, replace, shift and update;
# that don't end with '!'.
