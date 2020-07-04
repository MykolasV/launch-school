def missing(array)
  result = []

  array.each do |number|
    addition = 1
    until array.include?(number + addition) ||
          (number + addition) > array.last

      result << (number + addition)
      addition += 1
    end
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

puts '-----'

# Or

def missing(array)
  [*array.first..array.last].reject { |num| array.include?(num) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

puts '-----'

# Given solution

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

puts '-----'

# Further exploration

def missing(array)
  [*array.first..array.last] - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
