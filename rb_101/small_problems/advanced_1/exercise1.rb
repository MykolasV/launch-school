nouns = ['cat', 'hero', 'monkey', 'dog']
verbs = ['walk', 'laugh', 'run', 'dance']
adjectives = ['small', 'round', 'handsome', 'slow']
adverbs = ['rapidly', 'clumsily', 'diligently', 'kindly']

types_of_words = { 'noun' => nouns, 'verb' => verbs, 'adjective' => adjectives, 'adverb' => adverbs }

text = File.read('exercise1.txt')

result = text.split("\n").map do |line|
  line.split.map do |word|
    sorted_word = word.delete('^A-Za-z')
    if types_of_words.key?(sorted_word)
      word.gsub(sorted_word, types_of_words[sorted_word].shuffle!.pop)
    else
      word
    end
  end.join(' ')
end.join("\n")

puts result
puts '-----'

# Given solution:

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('exercise1_given_solution.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
