def negative(num)
  return num if num <= 0
  num.to_s.prepend('-').to_i
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
puts '-----'

# Or:

def negative(num)
  return num if num <= 0
  num - (num * 2)
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
puts '-----'

# Given solution:

def negative(number)
  number > 0 ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
puts '-----'

# Further exploration:

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
