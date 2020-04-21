def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
puts '-----'

# Further exploration:

def move(n, from_array, to_array)
  return if n == 0 || from_array.empty? # Need to check if from_array is empty or we'll get some nils appended to the to_array.
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(5, todo, done)
p todo # => []
p done # => ["apply sunscreen", "go to the beach", "study", "walk the dog", "coffee with Tom"]
