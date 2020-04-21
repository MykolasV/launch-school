def word_cap(string)
  string.split(' ').map { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
puts '-----'

# Given solution:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
puts '-----'

# Further exploration:

# 1:

def word_cap(string)
  string[0] = string[0].upcase
  iterator = 1
  loop do
    break if iterator == string.size
    string[iterator] = string[iterator].downcase
    string[iterator] = string[iterator].upcase if string[iterator - 1] == ' '
    iterator += 1
  end

  string
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
puts '-----'

# 2:

def word_cap(string)
  uppercase_letters = ('A'..'Z').to_a
  lowercase_letters = ('a'..'z').to_a
  
  # Convert all letters to lowercase:
  iterator = 0
  loop do
    break if iterator == string.size
    current_char = string[iterator]
    if uppercase_letters.include?(current_char)
      string[iterator] = lowercase_letters[uppercase_letters.index(current_char)]
    end

    iterator += 1
  end

  # Convert first letter of every word to uppercase:
  string[0] = uppercase_letters[lowercase_letters.index(string[0])]
  iterator = 1
  loop do
    break if iterator == string.size
    current_char = string[iterator]

    if string[iterator - 1] == ' ' && lowercase_letters.include?(current_char)
      string[iterator] = uppercase_letters[lowercase_letters.index(current_char)]
    end

    iterator += 1
  end

  string
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
