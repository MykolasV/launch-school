x = 0
3.times do
  x += 1
end
puts x  # => 3

y = 0
3.times do
  y += 1
  x = y
end
puts x  # => gives an error because the variable was initiated inside the block
        #    and therefore is unavailable in the outer scope afterwards.
