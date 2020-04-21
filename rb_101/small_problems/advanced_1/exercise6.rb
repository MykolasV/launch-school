def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# The elsif branch within the if statement had a missing conditional expression
# on line 4. More precisely, when ruby parser couldn't find a conditional
# expression on the same line as elsif, it went to the next line and took the
# method call #map as the conditional expression. #map always returns an array,
# and an array object is truthy, however there's no code after that, which is
# why nil is returned. If there is no code in a branch, then it's equivalent to
# the expression nil. This is why my_method always returned nil instead of an
# Array when the input array isn't empty.
