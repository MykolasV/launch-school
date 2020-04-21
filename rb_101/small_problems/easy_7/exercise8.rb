def multiply_list(array_1, array_2)
  result = []

  array_1.each_with_index do |number, index|
    result << (number * array_2[index])
  end

  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
puts '-----'

# Or:

def multiply_list(array_1, array_2)
  result = []

  idx = 0
  loop do
    break if idx > (array_1.size - 1)
    result.push(array_1[idx] * array_2[idx])
    idx += 1
  end

  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
puts '-----'

# Further exploration:

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map { |arr| arr.inject(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
