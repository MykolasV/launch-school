def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end           
end     # fixed.

equal_to_four(5)

# The 'end' in the code matches the if..else statement but does not close off
# the method. We can fix this by indenting the present 'end' to the if..else 
# statement and adding another 'end' below.
