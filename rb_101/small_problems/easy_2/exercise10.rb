array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# => Moe
#    Larry
#    CURLY
#    SHEMP
#    Harpo
#    CHICO
#    Groucho
#    Zeppo

# On line 3, each value in array1 is appended to an empty array2,
# making both arrays identical. In fact, they now hold the same objects.
# We can see that if we invoke a method object_id on array1[0] and array2[0]:

# 2.6.3 :007 > array1[0].object_id
#  => 6515720
# 2.6.3 :008 > array2[0].object_id
#  => 6515720

# The same will be true for the remaining values in both arrays.
# On line 4, a destructive method upcase! is invoked on every value in array1
# that starts with 'C' or 'S', making a permanent change on those objects.
# Since we know that both arrays hold the same objects, the transformation will
# be visable in array2 as well, which is what we see in the output.

# From discussion:
# The answer lies in the fact that the first each loop simply
# copies a bunch of references from array1 to array2. When that first loop
# completes, both arrays not only contain the same values, they contain the
# same String objects. If you modify one of those Strings, that modification
# will show up in both Arrays.
