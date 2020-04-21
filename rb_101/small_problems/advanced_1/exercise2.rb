def initialize_grid(num)
  grid = []
  num.times { grid << [] }
  grid.each { |sub_arr| num.times { |idx| sub_arr[idx] = ' ' } }
  middle_line_idx = num / 2
  num.times { |idx| grid[middle_line_idx][idx] = '*' }

  grid
end

def star(num)
  arrays_of_stars = initialize_grid(num)

  middle_line_idx = num / 2
  star_distance = middle_line_idx
  0.upto(middle_line_idx - 1) do |arr_idx|
    (arr_idx..(num - 1)).step(star_distance) do |sub_arr_idx|
      unless arrays_of_stars[arr_idx].count('*') == 3
        arrays_of_stars[arr_idx][sub_arr_idx] = '*'
      end
    end
    star_distance -= 1
  end

  arrays_of_stars[(middle_line_idx + 1)..-1] =
    arrays_of_stars[0..middle_line_idx - 1].reverse

  arrays_of_stars.each { |arr| puts arr.join }
end

star(7)
puts ''
star(9)
puts ''
puts '-----'
puts ''

# Given solution:

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

star(7)
puts ''
star(9)
