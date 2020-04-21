def swap(str)
  str = str.split(' ')
  
  str.each do |word|
    first_letter = word[0]
    last_letter  = word[-1]
    
    word[0]   = last_letter
    word[-1]  = first_letter
  end
  
  str.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
puts '-----'

# Or:

def swap(str)
  str = str.split(' ')
  
  str.each { |word| word[0], word[-1] = word[-1], word[0] }
  str.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
puts '-----'

# Given solution:

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
puts '-----'

# Further exploration:

def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Doesn't work because swap_first_last_characters(word[0], word[-1]) will
# return only first and last character reversed omitting the rest of the
# letters in the word.
