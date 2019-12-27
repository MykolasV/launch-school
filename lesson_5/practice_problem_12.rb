arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}

arr.each do |sub_arr|
  hsh[sub_arr.first] = sub_arr.last
end

p arr
p hsh
puts '-----'

# Or:

result = arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1]
end

p arr
p result
