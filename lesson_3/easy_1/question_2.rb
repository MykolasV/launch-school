1. what is != and where should you use it?
# It means "Not equal to" and should be used in flow control comparison,
# i.e. 'if' statement, to return a boolean.

2. put ! before something, like !user_name
# Means 'false' or the 'not' operator. Returns the opposite of the booleans
# value that the '!' is prepended to.

3. put ! after something, like words.uniq!
# Conventionally means that a permanent change is being made on the object.
# For example, a destructive method is being invoked, as in the above example.

4. put ? before something
# The value after '?' should return true or false.

5. put ? after something
# A boolean value should be returned.

6. put !! before something, like !!user_name
# Returns a boolean value. '!!' means 'not not' and will change the truthiness 
# of an object to the opposite twice, so will return 'true' on a truthy value.
# From solution:
# !!<some object> is used to turn any object into their boolean equivalent.
