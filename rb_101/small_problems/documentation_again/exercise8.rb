a = [5, 9, 3, 11]
puts a.min(2)

# Alternatively:
a = [5, 9, 3, 11]
smallest = []
smallest << a.sort[0..1]

puts smallest
