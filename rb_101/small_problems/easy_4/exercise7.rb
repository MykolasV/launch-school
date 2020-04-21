DIGITS = {
  '0' => 0, '1' => 1, '2' => 2,
  '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8,
  '9' => 9
}.freeze

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

puts '-----'

# Further exploration:

HEXA = {
  '0' => 0, '1' => 1, '2' => 2,
  '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, 'A' => 10, 'B' => 11,
  'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15
}.freeze

def hexadecimal_to_integer(str)
  digits = str.upcase.chars.map { |char| HEXA[char] }

  result = digits.shift
  digits.each { |digit| result = result * 16 + digit }
  result
end

p hexadecimal_to_integer('4D9f') == 198_71
