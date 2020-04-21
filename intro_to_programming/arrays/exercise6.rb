names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'
puts names 

# The attempt was to change the name 'Margaret', which is at index 3 in the array,
# to a name 'Jody'. The way to reference an element in the array is by it's index 
# and not element itself, which is why there was an error.
