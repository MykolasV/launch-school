example1 = File.read('exercise1a.txt')
example2 = File.read('exercise1b.txt')

def sentences(text)
  sentences = text.split('.')

  %w(! ?).each do |delimiter|
    sentences.map! do |sentence|
      if sentence.count(delimiter) > 0
        sentence.split(delimiter)
      else
        sentence
      end
    end
  end

  sentences.flatten
end

def longest_sentence(text)
  longest = ''

  sentences(text).each do |sentence|
    if sentence.split.size > longest.split.size
      longest = sentence.strip
    end
  end

  puts longest
  puts "=> #{longest.split.size} words."
end

longest_sentence(example1)
puts ''
longest_sentence(example2)
puts '-----'

# Given solution:

text = example1
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
puts '-----'

# Further exploration:

# punctuation at the end
sentences = text.split(/\. |\? |! /)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
puts '-----'

# longest paragraph
paragraphs = text.split(/\.\n\s|\?\n\s|!\n\s/)
longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
longest_paragraph = longest_paragraph.strip

puts "#{longest_paragraph}"
puts '------'

# longest_word
words = text.delete(',.?!').split
longest_word = words.max_by(&:size)
p longest_word
