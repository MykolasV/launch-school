def buy_fruit(fruits)
  fruits.each_with_object([]) do |fruit, arr|
    fruit[1].times { arr << fruit[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
puts '-----'

# Or:

def buy_fruit(fruits)
  result = []

  iterator = 0
  loop do
    break if iterator > fruits.size - 1
    fruit  = fruits[iterator][0]
    number = fruits[iterator][1]
    number.times { result << fruit }
    iterator += 1
  end

  result
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
puts '-----'

# Given solutions:

# 1:

def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
puts '-----'

# 2:

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
