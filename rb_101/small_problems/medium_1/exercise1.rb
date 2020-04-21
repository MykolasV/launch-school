def rotate_array(arr)
  result = []
  1.upto(arr.size - 1) { |idx| result << arr[idx] }
  result << arr.first
  result
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

puts '-----'

# Or:

def rotate_array(arr)
  arr[1..-1] + arr[0, 1]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

puts '-----'

# Or:

def rotate_array(arr)
  result = arr.clone
  result << result.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

puts '-----'

# Further exploration:

def rotate_string(str)
  rotate_array(str.chars).join
end

p rotate_string('String') == 'tringS'
puts '-----'

def rotate_integer(num)
  rotate_string(num.to_s).to_i
end

p rotate_integer(12345) == 23451
