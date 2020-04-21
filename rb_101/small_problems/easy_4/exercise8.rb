DIGITS = {
  '0' => 0, '1' => 1, '2' => 2,
  '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8,
  '9' => 9
}.freeze

def negative_num?(str)
  negative = ''
  negative = str.chars.first if str.start_with?('-')
  negative == '-'
end

def string_to_signed_integer(str)
  negative = negative_num?(str)
  str.delete!('+') if str.start_with?('+')
  str.delete!('-') if str.start_with?('-')

  digits = str.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }

  value *= -1 if negative
  value
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
puts '-----'

# Further exploration:

def string_to_integer(str)
  digits = str.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  string.delete!('+')
  string.include?('-') ? -string_to_integer(string[1..-1]) : string_to_integer(string)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
