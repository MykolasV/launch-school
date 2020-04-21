def reverse!(arr)
  first_idx = 0
  last_idx  = arr.size - 1

  loop do
    break if last_idx <= 1
    saved_item = arr[first_idx]
    arr[first_idx] = arr[last_idx]
    arr[last_idx]  = saved_item
    first_idx += 1
    last_idx -= 1
  end

  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '-----'

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
puts '-----'

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
puts '-----'

list = []
p reverse!(list) == []
p list == []

puts ''
puts '*****'
puts ''

# Or

def reverse!(arr)
  first_idx = 0
  last_idx  = arr.size - 1

  until last_idx <= 1
    arr[first_idx], arr[last_idx] = arr[last_idx], arr[first_idx]
    first_idx += 1
    last_idx -= 1
  end

  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '-----'

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
puts '-----'

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
puts '-----'

list = []
p reverse!(list) == []
p list == []

puts ''
puts '*****'
puts ''

# Given solution:

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '-----'

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
puts '-----'

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
puts '-----'

list = []
p reverse!(list) == []
p list == []
