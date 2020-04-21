[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]

# select evaluates the return value of the block, which is the last line.
# If it is truthy, the element is selected. In this case the return value will
# always be 'hi', which is truthy. Therefore every element during iteration will
# be selected and returned in a new array.
