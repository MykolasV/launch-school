def interleave(arr1, arr2)
  result = []

  iterator = 0
  loop do
    break if iterator == arr1.size
    result << arr1[iterator]
    result << arr2[iterator]
    iterator += 1
  end

  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts '-----'

# Or:

def interleave(arr1, arr2)
  index = 1
  arr1.size.times do |idx|
    arr1.insert(index, arr2[idx])
    index += 2
  end

  arr1
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts '-----'

# Given solution:

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts '-----'

# Further exploration:

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
