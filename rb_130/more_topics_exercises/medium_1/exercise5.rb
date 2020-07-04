items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1

gather(items) do |*produce, last|
  puts produce.join(', ')
  puts last
end

puts '-----'

# 2

gather(items) do |fruits, *vegetables, grains|
  puts fruits
  puts vegetables.join(', ')
  puts grains
end

puts '-----'

# 3

gather(items) do |fruits, *remainder|
  puts fruits
  puts remainder.join(', ')
end

puts '-----'

# 4

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
