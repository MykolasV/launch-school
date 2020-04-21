def remove_vowels(strings_array)
  vowels = %w(a e i o u A E I O U)

  strings_array.each do |string|
    vowels.each do |vowel|
      string.delete!(vowel) if string.include?(vowel)
    end
  end

  strings_array
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
puts ''

# Or:

def remove_vowels(strings_array)
  result = []

  index = 0
  loop do
    break if index == strings_array.size
    current_string_chars = strings_array[index].chars
    sorted_string_chars  = []

    iterator = 0
    loop do
      break if iterator == current_string_chars.size
      current_char = current_string_chars[iterator]

      if !%w(a e i o u A E I O U).include?(current_char)
        sorted_string_chars << current_char
      end

      iterator += 1
    end

    result[index] = sorted_string_chars.join
    index += 1
  end

  result
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
puts ''

# Given solution:

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
puts ''

# Further exploration:

def remove_vowels(strings)
  strings.map { |string| string.gsub(/[aeiou]/i, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
puts ''

# Or:

def remove_vowels(strings)
  strings.map { |string| string.scan(/[^aeiou]/i).join }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
puts ''

# Or:

def remove_vowels(strings)
  strings.map { |string| string.tr('aeiouAEIOU', '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
