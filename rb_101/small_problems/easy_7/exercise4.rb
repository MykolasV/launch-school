def swapcase(string)
  result = ''
  uppercase_letters = ('A'..'Z').to_a
  lowercase_letters = ('a'..'z').to_a

  iterator = 0
  loop do
    break if iterator == string.size
    current_char = string[iterator]

    if uppercase_letters.include?(current_char)
      result << lowercase_letters[uppercase_letters.index(current_char)]
    elsif lowercase_letters.include?(current_char)
      result << uppercase_letters[lowercase_letters.index(current_char)]
    else
      result << current_char
    end

    iterator += 1
  end

  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts '-----'

# Or:

def swapcase(string)
  result = ''
  uppercase_letters = ('A'..'Z').to_a
  lowercase_letters = ('a'..'z').to_a
  upper_lower_hash  = uppercase_letters.zip(lowercase_letters).to_h

  string.chars do |char|
    if upper_lower_hash.has_key?(char)
      result << upper_lower_hash[char]
    elsif upper_lower_hash.has_value?(char)
      result << upper_lower_hash.key(char)
    else
      result << char
    end
  end

  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts '-----'

# Or:

def swapcase(string)
  result = ''

  string.chars do |char|
    case char == char.downcase
    when true  then result << char.upcase
    else            result << char.downcase
    end
  end

  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts '-----'

# Given solution:

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
