def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
puts '-----'

# Or:

def penultimate(string)
  words = string.split(' ')

  iterator = 0
  loop do
    return words[iterator] if iterator == (words.size - 2)
    iterator += 1
  end

end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
puts '-----'

# Or:

def penultimate(string)
  words = string.split
  penultimate_word = nil

  words.each do |word|
    penultimate_word = word if words.index(word) == (words.size - 2)
  end

  penultimate_word
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
puts '-----'

# Further exploration:

def middle_word(string)
  return '' if string.empty?

  words = string.split
  middle_idx = ((words.size - 1) / 2.0).round
  words[middle_idx]
end

p middle_word('What edge cases need to be considered?')
p middle_word('Launch School is great!')
p middle_word('last word')
p middle_word('word')
p middle_word('')
