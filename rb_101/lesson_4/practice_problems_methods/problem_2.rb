['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2

# If a block is given, counts the number of elements for which the block
# returns a true value.

# https://ruby-doc.org/core-2.6.5/Array.html#method-i-count
