def diamond(num)
  stars = []
  1.upto(num) { |n| stars << n if n.odd? }

  space_num = num / 2
  stars.each do |star_num|
    puts ' ' * space_num + '*' * star_num
    space_num -= 1
  end

  space_num = 1
  stars.reverse[1..-1].each do |star_num|
    puts ' ' * space_num + '*' * star_num
    space_num += 1
  end
end

diamond(1)
puts ''
diamond(3)
puts ''
diamond(9)
puts ''

# Or:

def generate_stars(num)
  stars = []
  1.upto(num) { |n| stars << n if n.odd? }
  stars += stars[0..-2].reverse
  stars
end

def generate_spaces(stars)
  (0..stars.size / 2).to_a.reverse + (1..stars.size / 2).to_a
end

def diamond(num)
  stars = generate_stars(num)
  spaces = generate_spaces(stars)

  stars.each_with_index do |star_num, idx|
    puts ' ' * spaces[idx] + '*' * star_num
  end
end

diamond(1)
puts ''
diamond(3)
puts ''
diamond(9)
puts ''

# Given solution:

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(1)
puts ''
diamond(3)
puts ''
diamond(9)
puts ''

# Further exploration:

def generate_stars(num)
  stars = []
  3.upto(num) { |n| stars << "*#{' ' * (n - 2)}*" if n.odd? }
  stars += stars[0..-2].reverse
  stars.unshift('*')
  stars.push('*')
  stars
end

def generate_spaces(stars)
  (0..stars.size / 2).to_a.reverse + (1..stars.size / 2).to_a
end

def diamond(num)
  return puts '*' if num == 1

  stars = generate_stars(num)
  spaces = generate_spaces(stars)

  stars.each_with_index do |row, idx|
    puts row.rjust(row.size + spaces[idx])
  end
end

diamond(5)
