def running_total(arr)
  result = []
  accumulator = 0

  arr.each do |num|
    accumulator += num
    result << accumulator
  end

  result
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Given solution:

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

# Further exploration:

def running_total(arr)
  sum = 0
  arr.each_with_object([]) { |num, a| a << sum += num }
end

def running_total(arr)
  result = 0
  arr.inject([]) { |sum, n| sum << result += n }
end
