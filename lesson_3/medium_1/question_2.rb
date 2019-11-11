puts "the value of 40 + 2 is " + (40 + 2)

# We get a TypeError because Ruby doesn't allow adding numbers to strings implicitly.

# Solutions:

# 1:
puts "the value of 40 + 2 is " + (40 + 2).to_s

# 1:
puts "the value of 40 + 2 is #{40 + 2}"
