def each_with_index(array)
  iterator = 0
  while iterator < array.size
    yield(array[iterator], iterator)
    iterator += 1
  end

  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

puts '-----'

# given solution

def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
