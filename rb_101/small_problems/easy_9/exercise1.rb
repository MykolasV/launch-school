def greetings(name_array, info_hash)
  "Hello, #{name_array.join(' ')}! Nice to have a " \
    "#{info_hash.values[0..-1].join(' ')} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Or:

def greetings(name_array, info_hash)
  'Hello, ' + name_array.join(' ') + '!' + ' Nice to have a ' \
    + info_hash.values.join(' ') + ' around.'
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Given solution:

def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a " \
    "#{status[:title]} #{status[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
