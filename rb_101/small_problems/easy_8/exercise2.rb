print 'Enter a noun: '
noun = gets.chomp
print 'Enter a verb: '
verb = gets.chomp
print 'Enter an adjective: '
adjective = gets.chomp
print 'Enter an adverb: '
adverb = gets.chomp

sentence_1 = "Let us #{adverb} #{verb} with the #{adjective} #{noun}."
# From the solution:
sentence_2 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_3 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_4 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3, sentence_4].sample
