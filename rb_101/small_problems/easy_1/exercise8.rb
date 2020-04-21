def average(arr)
  arr.sum / arr.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


def further_exploration_average(arr)
  arr.sum / arr.size.to_f
end

puts further_exploration_average([1, 5, 87, 45, 8, 8])
puts further_exploration_average([9, 47, 23, 95, 16, 52])
