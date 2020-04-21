hash = { a: 'ant', b: 'bear' }

hash.shift # => [ :a, 'ant' ]

# Removes a (the first) key-value pair from hash and returns it as the two-item
# array [ key, value ], or the hash's default value if the hash is empty.

# https://ruby-doc.org/core-2.6.5/Hash.html#method-i-shift

# since the shift method is destructive after the invocation the original hash
# will be modified:

p hash # =>  { b: 'bear'}
