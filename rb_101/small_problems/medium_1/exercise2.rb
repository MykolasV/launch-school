def rotate_array(arr)
  arr[1..-1] + arr[0, 1]
end

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse

  return rotate_array(digits).join.to_i if digits.size == n

  (digits[0..(digits.size - n) - 1] + rotate_array(digits[-n..-1])).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
puts '-----'

# Or:

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse
  rightmost_digits = []

  n.times { rightmost_digits << digits.pop }
  rightmost_digits = rightmost_digits.reverse

  (digits + rotate_array(rightmost_digits)).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
puts '-----'

# Given solution:

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
