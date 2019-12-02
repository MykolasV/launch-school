[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]

# Returns a new array containing the items in self for which the given block is
# not true.
# https://ruby-doc.org/core-2.6.5/Array.html#method-i-reject

# In the given example the block will always return nil because of puts, which
# is falsey. Therefore every item will be included in the new array. 
