ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
  "Marilyn" => 22, "Spot" => 237 }
  
p ages.values.sum

# Or:

result         = 0
numbers_array  = ages.values
iterator       = 0

loop do
  break if iterator == numbers_array.size
  current_age = numbers_array[iterator]
  result += current_age
  iterator += 1
end

p result

# Or:

p ages.values.inject(&:+)

# Or:

result = 0
ages.each do |key, value|
  result += value
end

p result

# Or:

result = 0
ages.values.each { |num| result += num }

p result
