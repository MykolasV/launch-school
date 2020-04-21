WORD_NUMBER = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
                'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
                'eight' => '8', 'nine' => '9' }

def word_to_digit(string)
  string.split.map do |word|
    current_word = word.downcase.delete('^a-z')
    if WORD_NUMBER.key?(current_word)
      word.gsub(current_word, WORD_NUMBER[current_word])
    else
      word
    end
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts '-----'

# Given solution:

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts '-----'

# Further exploration:

def word_to_digit(string)
  result = ''

  string.split.each do |word|
    current_word = word.downcase.delete('^a-z')
    if WORD_NUMBER.key?(current_word)
      result += word.downcase.gsub(current_word, WORD_NUMBER[current_word])
    else
      result += ' ' + word + ' '
    end
  end

  result.split.join(' ')
end

# uppercase and capitalized words + removing spaces between created numbers
p word_to_digit('Please call me at five Five five one TWO three Four. Thanks 1 5 9.') == 'Please call me at 5551234. Thanks 1 5 9.'

# phone number
def phone_number_format(nums_string)
  "(#{nums_string[0..2]}) #{nums_string[3..5]}-#{nums_string[6..9]}"
end

def extract_phone_number(string)
  result = ''
  0.upto(string.size - 1) do |idx|
    if WORD_NUMBER.values.include?(string[idx]) &&
       WORD_NUMBER.values.include?(string[idx - 1]) ||
       WORD_NUMBER.values.include?(string[idx + 1])
       result += string[idx]
       result = result.delete(' ')
       break if result.size == 10
    end
  end

  result
end

def word_to_digit(string)
  result = ''

  string.split.each do |word|
    current_word = word.downcase.delete('^a-z')
    if WORD_NUMBER.key?(current_word)
      result += word.downcase.gsub(current_word, WORD_NUMBER[current_word])
    else
      result += ' ' + word + ' '
    end
  end

  result = result.split.join(' ')
  phone_number = extract_phone_number(result)
  result.gsub(phone_number, phone_number_format(phone_number))
end

p word_to_digit('Please call me at one TWO three Four five six seven Eight NINE zero. Thanks 1 5 9.') ==
'Please call me at (123) 456-7890. Thanks 1 5 9.'
