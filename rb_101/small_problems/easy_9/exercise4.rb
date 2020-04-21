def sequence(number)
  result = []

  counter = 1
  loop do
    break if counter > number
    result << counter
    counter += 1
  end

  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts '-----'

# Or:

def sequence(number)
  result = []
  1.upto(number) { |num| result << num }
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts '-----'

# Or:

def sequence(number)
  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts '-----'

# Further exploration:

def sequence(number)
  return [] if number <= 0
  (1..number).to_a
end

p sequence(0) == []
p sequence(-1) == []
