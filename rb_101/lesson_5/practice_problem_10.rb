arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

result = arr.map do |hash|
  hash.each_with_object({}) do |(key, value), hsh|
    hsh[key] = value + 1
  end
end

p result
p arr
puts '-----'

# Given solution:

result = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p result
