def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(15)
p factors(0)
p factors(-5)

# Bonus 1:
# The purpose of number % divisor == 0 is to find out if a number divided by
# divisor has a remainder, if it does then the result of the devision cannot be
# a factor.

# Bonus 2:
# The purpose of line 8 is for the factors array to be the return value
# of the method.
