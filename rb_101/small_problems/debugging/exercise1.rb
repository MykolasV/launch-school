def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
puts '-----'

# Further exploration:

def decrease(counter)
  counter - 1
end

counter = 10

while counter > 0 do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
