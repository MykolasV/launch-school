limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# The error message says: undefined local variable or method `limit' for
# main:Object (NameError).

# Method definitions are self-contained so cannot access variables initiated
# outside of its scope.
# We can fix the code by making 'limit' the third argument of the method and
# passing in the variable 'limit' initiated on line 1 when invoking the method
# on line 12.
