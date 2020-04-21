def triangle(num)
  stars = 1
  num.times do
    puts ' ' * (num - stars) + '*' * stars
    stars += 1
  end
end

triangle(5)
puts ''
triangle(9)
puts ''

# Or:

puts 'Same: '
puts ''

def triangle(num)
  stars = 1
  spaces = num - 1
  while spaces >= 0
    puts "#{' ' * spaces}#{'*' * stars}"
    stars += 1
    spaces -= 1
  end
end

triangle(5)
puts ''
triangle(9)
puts ''

# Further exploration:

# Upside down:

puts 'Upside down: '
puts ''

def triangle(num)
  stars  = num
  spaces = 0
  num.times do
    puts ' ' * spaces + '*' * (stars - spaces)
    spaces += 1
  end
end

triangle(5)
puts ''
triangle(9)
puts ''

# Any corner:

puts 'All corners: '
puts ''

def triangle(num, corner)
  if corner == 'down right'
    stars = 1
    num.times do
      puts ' ' * (num - stars) + '*' * stars
      stars += 1
    end
  elsif corner == 'up right'
    stars  = num
    spaces = 0
    num.times do
      puts ' ' * spaces + '*' * (stars - spaces)
      spaces += 1
    end
  elsif corner == 'up left'
    stars  = num
    num.times do
      puts '*' * stars
      stars -= 1
    end
  elsif corner == 'down left'
    stars  = 1
    num.times do
      puts '*' * stars
      stars += 1
    end
  end
end

triangle(5, 'down right')
puts ''
triangle(9, 'up right')
puts ''
triangle(9, 'up left')
puts ''
triangle(5, 'down left')
