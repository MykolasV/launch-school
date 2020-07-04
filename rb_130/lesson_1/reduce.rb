def reduce(array, accumulator = array[0])
  counter = (accumulator == array[0] ? 1 : 0 )

  while counter < array.size
    current_value = array[counter]
    accumulator = yield(accumulator, current_value)
    counter += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value } == 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } == [1, 2, 'a', 'b']

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } == 15
p reduce(array, 10) { |acc, num| acc + num } == 25
reduce(array) { |acc, num| acc + num if num.odd? }  # => NoMethodError: undefined method `+' for nil:NilClass
