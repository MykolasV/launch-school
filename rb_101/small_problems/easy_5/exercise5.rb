def cleanup(str)
  " #{str.gsub(/[^a-z]/i, ' ').split(' ').join(' ')} "
end

p cleanup("---what's my +*& line?") == ' what s my line '
puts '-----'

# Further exploration:

ALPHABET = ('a'..'z').to_a

def cleanup(str)
  cleared_str = []

  str.split('').each do |char|
    cleared_str << ' ' if char == ' ' || !ALPHABET.include?(char)
    cleared_str << char if ALPHABET.include?(char)
  end

  cleared_str = cleared_str.join.split.join(' ')
  ' ' + cleared_str + ' '
end

p cleanup("---what's my +*& line?") == ' what s my line '
puts '-----'

# Given solution:

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
