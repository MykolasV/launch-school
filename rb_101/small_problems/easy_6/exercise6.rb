def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts '-----'

# Or:

def merge(arr1, arr2)
  arr1.insert(-1, arr2).flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts '-----'

# Or:

def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts '-----'

# Or:

def merge(arr1, arr2)
  arr1.union(arr2)
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
