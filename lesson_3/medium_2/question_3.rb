def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# my_string will look the same as before the method call, because it's object
# will get binded to a different variable within the method and that variable 
# will be reassigned to a different object which has no effect on the original
# string object that was passed in.

# my_array will look different after the method call, because even though the
# array is tied to a different variable name within the method, a destructive
# method Array#push or << is called on the array object that both variables
# are referencing. Because the method is mutating, an additional element is
# added to the array, which will show when retrieving the value of the original
# my_array variable after the method execution.
