books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

result = books.sort_by do |hash|
  hash[:published].to_i
end

puts books
puts '-----'
puts result

puts ''

# Given solution:

result = books.sort_by do |book|
  book[:published]               # no conversion
end

puts books
puts '-----'
puts result
