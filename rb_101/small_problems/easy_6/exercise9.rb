def include?(arr, el)
  arr.each { |item| return true if item == el }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
puts '-----'

# Or:

def include?(arr, el)
  duplicate = []
  arr.each { |item| duplicate << item if item == el }
  !duplicate.empty?
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
puts '-----'

# Given solution:

def include?(array, value)
  !!array.find_index(value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
puts '-----'

# Further exploration:

def include?(array, value)
  array.any?(value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
puts '-----'

# Or:

def include?(array, value)
  array.count(value) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
