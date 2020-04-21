def fibonacci(nth)
  return 1 if nth == 1 || nth == 2

  num1 = 1
  num2 = 1
  sum = 0
  (nth - 2).times do
    sum = num1 + num2
    num1 = num2
    num2 = sum
  end

  sum
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
puts '-----'

# Given solution:

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
