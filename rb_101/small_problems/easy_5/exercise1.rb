def ascii_value(string)
  result = 0
  string.chars { |char| result += char.ord }
  result
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
puts '-----'

# Alternatively:

def ascii_value(string)
  string.chars.inject(0) { |acc, elem| acc += elem.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
puts '-----'

# or:

def ascii_value(string)
  string.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
puts '-----'

# Further exploration:

p 'a'.ord.chr == 'a'     # => true
p 'abc'.ord.chr == 'abc' # => false
