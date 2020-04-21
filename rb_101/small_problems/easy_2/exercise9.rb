name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# => BOB
#    BOB

# First, a variable 'name' is initialized and assigned to a string 'Bob'.
# Then, another variable save_name is initialized and assigned to the value
# of name. Both of the variables are now pointing to the same string object.
# A method upcase! is invoked on the variable name which holds the value
# assigned to both variables. Since upcase! is a desrtuctive method, it changed
# the string object 'Bob' to all capital letters. As both variables are still
# pointing to the same, now transformed value, the same value is printed twice.

# From the discussion:
# Assignment in ruby just assigns a reference to a variable,
# both name and save_name refer to the same string, Bob. When you apply
# name.upcase!, which mutates name in place, the value that save_name references
# also changes. Thus, both name and save_name are set equal to 'BOB'.
