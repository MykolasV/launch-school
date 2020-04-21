[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]

# In the if condition, every number that's more than 1 will return nil because
# puts always returns nil. The only item in the array that will be returned by
# the else condition is the first item: 1.
