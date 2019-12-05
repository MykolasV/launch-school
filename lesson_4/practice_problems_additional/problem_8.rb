numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#  1
#  3

# => [3, 4]

# During the first iteration of Array#each method, the item at index 0 of the
# array, 1, is printed out and destructively removed by Array#shift method, so
# we're now left with numbers array as [2, 3, 4].
# During the second iteration, the item at index 1 of the array, 3, is printed
# out and the first item of the array, which is now 2, is again removed from
# the array by Array#shift. Now we're left with numbers array as [3, 4].
# Since the each method has already iterated twice and we have two items left
# in the array, no further iteration is performed. The remaining array,
# [3, 4], is returned by the Array#each method.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#  1
#  2

# => [1, 2]

# Array#pop is the opposite of Array#shift in that it destructively removes the
# last item of the array. By the time the Array#each method has iterated twice
# and printed out the first two items, Array#pop has removed the last two
# items. So the numbers array has now shrunk to [1, 2].
# Since there are no more items in the array, no more iterations are performed.
# [1, 2] is returned by the Array#each method.

# Important point from given solution:
# In both cases we see that iterators DO NOT work on a copy of the original
# array or from stale meta-data (length) about the array. They operate on the
# original array in real time.
