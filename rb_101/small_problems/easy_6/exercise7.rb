def halvsies(arr)
  result = []

  if arr.size.even?
    midpoint_idx = (arr.size / 2) - 1
  else
    midpoint_idx = (arr.size / 2)
  end

  result << arr[0..midpoint_idx]
  result << arr[(midpoint_idx + 1)..-1]

  result
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
puts '-----'

# Or:

def halvsies(arr)
  if arr.size.even?
    midpoint_idx = (arr.size / 2) - 1
  else
    midpoint_idx = arr.size / 2
  end

  arr.partition { |v| arr.index(v) <= midpoint_idx }
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
puts '-----'

# Given solution:

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Further exploration:
# In the given solution array.size was divided by 2.0 instead of 2 in order to
# get a float number which could be rounded up by Array#ceil when array.size
# returns an odd number.
