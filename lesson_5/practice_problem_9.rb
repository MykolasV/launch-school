arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

result = arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

p arr
p result
puts '-----'

# Or:

result = arr.map do |sub_arr|
  sub_arr.sort.reverse
end

p arr
p result
