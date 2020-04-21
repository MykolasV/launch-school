WORD_FOR_NUMBER = {
  0 => 'zero', 1 => 'one', 2 => 'two',
  3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight',
  9 => 'nine', 10 => 'ten', 11 => 'eleven',
  12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
  15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
  18 => 'eighteen', 19 => 'nineteen'
}

def alphabetic_number_sort(array)
  result = []
  numbers_in_words = []

  array.each do |num|
    numbers_in_words << WORD_FOR_NUMBER[num]
  end

  numbers_in_words.sort!

  numbers_in_words.each do |word|
    result << WORD_FOR_NUMBER.key(word)
  end

  result
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
puts '-----'

# Given solution:

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Further exploration:

# Array#sort_by! was not used because it mutates the caller, whereas
# Enumerable#sort_by returns a new array.
