def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = "hello world"

puts "Object id of variable 'str' is #{str.object_id}."
# => Object id of variable 'str' is 12440560.

puts "The method will return an object with the id of #{spin_me(str).object_id}."
# => The method will return an object with the id of 12440200.

# The string returned by the method will be a different object.
# We get away from the original object irreversably when the String#split
# method is invoked on the argumemt within the spin_me method.
