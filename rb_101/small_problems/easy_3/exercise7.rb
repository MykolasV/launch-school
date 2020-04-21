def oddities(arr)
  result = []

  arr.each_with_index do |value, index|
    result << value if index.even?
  end

  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

puts ''

# Further exploration:

def evens(arr)
  odd_elements = []
  index = 1
  while index < arr.size
    odd_elements << arr[index]
    index += 2
  end
  odd_elements
end

p evens([2, 3, 4, 5, 6]) == [3, 5]
p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens(['abc', 'def']) == ['def']
p evens([123]) == []
p evens([]) == []
