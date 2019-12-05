ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
   "Marilyn" => 22, "Spot" => 237 }

minimum = ages.values.min
p minimum

# Or:

just_ages = ages.values
minimum   = just_ages.shift

just_ages.each do |age|
  minimum = age if age < minimum
end

p minimum

# Or:

just_ages  = ages.values
minimum    = just_ages.shift
iterator   = 0

loop do
  break if iterator == just_ages.size
  current_age = just_ages[iterator]
  minimum = current_age if current_age < minimum
  iterator += 1
end

p minimum

# Or:

just_ages = ages.values
minimum   = just_ages.pop
iterator  = just_ages.size - 1

loop do
  break if iterator < 0
  current_age = just_ages[iterator]
  minimum = current_age if current_age < minimum
  iterator -= 1
end

p minimum
