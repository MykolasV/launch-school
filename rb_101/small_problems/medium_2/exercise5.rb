def valid_triangle?(sides_array)
  sorted_nums = sides_array.sort

  sorted_nums.size == 3 && sorted_nums.all? { |num| num > 0 } &&
    sorted_nums[0, 2].sum > sorted_nums.last
end

def triangle(num1, num2, num3)
  sides = [num1, num2, num3]
  return :invalid if !valid_triangle?(sides)

  if sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
puts '-----'

# Given solution:

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
