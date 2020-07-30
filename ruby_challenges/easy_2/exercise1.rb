def reverse_odd_words(string)
  return '' unless string.match?(/[a-z]/i)

  output = []
  words = string.delete('.').split
  words.each_with_index do |word, index|
    output << (index.odd? ? word.reverse : word)
  end

  output.join(' ') + '.'
end

p reverse_odd_words('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
p reverse_odd_words('whats the   matter with kansas .') == 'whats eht matter htiw kansas.'
p reverse_odd_words('hello    .') == 'hello.'
p reverse_odd_words('  ') == ''
p reverse_odd_words('.') == ''
