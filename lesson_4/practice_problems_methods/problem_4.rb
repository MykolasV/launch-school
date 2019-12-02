['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}

# Iterates the given block for each element with an arbitrary object given (in
# this case a hash), and returns the initially given object.

# https://ruby-doc.org/core-2.6.5/Enumerable.html#method-i-each_with_object
