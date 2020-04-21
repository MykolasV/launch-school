def rotate_array(arr)
  arr[1..-1] + arr[0, 1]
end

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse

  return rotate_array(digits).join.to_i if digits.size == n

  (digits[0..(digits.size - n) - 1] + rotate_array(digits[-n..-1])).join.to_i
end

def max_rotation(number)
  result = []
  numbers = number.to_s.chars

  until numbers.empty?
    numbers = rotate_array(numbers)
    result << numbers.shift
  end

  result.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
puts '-----'

# Or:

def max_rotation(number)
  n = number.to_s.length
  loop do
    break if n <= 1
    number = rotate_rightmost_digits(number, n)
    n -= 1
  end

  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
puts '-----'

# Given solution:

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
puts '-----'

# Further exploration:

# single method

def max_rotation(number)
  result = []
  numbers_array = number.to_s.chars
  number_digits = numbers_array.length

  number_digits.times do
    numbers_array = numbers_array[1..-1] + numbers_array[0, 1]
    result << numbers_array.shift
  end

  result.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
