numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
# => removes the value at index 1, which is integer 2.
p numbers # => [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
# => removes the occurences of the value provided as an argument when calling
# the method. In this case it's integer 1.
p numbers # => [2, 3, 4, 5]
