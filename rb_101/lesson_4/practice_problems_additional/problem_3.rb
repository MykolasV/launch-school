ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.reject! { |key, value| value >= 100 }
p ages

# Or:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.select! { |key, value| value < 100 }
p ages

# Or:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |key, value| value >= 100 }
p ages

# Or:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.each { |key, value| ages.delete(key) if value >= 100 }
p ages

# Or:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |key, value| value < 100 }
p ages

# Or:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages = ages.each_with_object({}) do |(key, value), hash|
  hash[key] = value if value < 100 
end

p ages

# Or:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
numbers_array = ages.values
iterator = 0

loop do
  break if iterator == numbers_array.size
  current_age = numbers_array[iterator]
  current_person = ages.key(current_age)
  ages.delete(current_person) if current_age >= 100
  iterator += 1
end

p ages
