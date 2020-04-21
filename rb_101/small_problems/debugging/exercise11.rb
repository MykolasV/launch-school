arr = ["9", "8", "7", "10", "11"]
reversed = arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

p reversed
puts '-----'

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]

# Given solution:

p(
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)

puts '-----'

# Or:

p arr.sort { |x, y| y.to_i <=> x.to_i }
