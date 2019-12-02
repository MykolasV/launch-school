{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [ nil, 'bear' ]

# Returns a new array with the results of running block once for every element
# in enum.

# https://ruby-doc.org/core-2.6.5/Enumerable.html#method-i-map

# the block returns false for ant'.size > 3 and the value 'ant' cannot be
# returned, therefore we see nil. The second item, 'bear' value is returned,
# as 'bear'.size > 3 returns true.
