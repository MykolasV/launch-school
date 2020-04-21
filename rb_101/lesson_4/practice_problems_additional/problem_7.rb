statement = "The Flintstones Rock"

letter_occurance = {}
letters_array = statement.chars
letters_array.delete(' ')

index = 0
loop do
  break if index == letters_array.size
  current_letter = letters_array[index]

  iterator = 0
  counter  = 0
  loop do
    if iterator == letters_array.size
      letter_occurance[current_letter] = counter
      break
    end

    counter  += 1 if letters_array[iterator] == current_letter
    iterator += 1
  end
  index += 1
end

p letter_occurance.sort.to_h

# Or:

statement = "The Flintstones Rock"

letter_occurance = {}
letters = statement.chars.uniq
letters.delete(' ')

letters.each do |letter|
  letter_occurance[letter] = statement.count(letter)
end

p letter_occurance.sort.to_h

# Or:

statement = "The Flintstones Rock"

letter_occurance = {}
letters = statement.chars.uniq
letters.delete(' ')

iterator = 0
loop do
  break if iterator == letters.size
  current_letter = letters[iterator]
  letter_occurance[current_letter] = statement.count(current_letter)
  iterator += 1
end

p letter_occurance.sort.to_h

# Given solution:

statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result
