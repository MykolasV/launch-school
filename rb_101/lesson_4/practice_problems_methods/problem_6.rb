['ant', 'bear', 'caterpillar'].pop.size

# => 11

# First, Array#pop method destructively removes the last item from the
# array and returns it:
# ['ant', 'bear', 'caterpillar'].pop => 'caterpillar'

# Then, String#size method is invoked on the the return value of the previous
# method:
# 'caterpillar'.size => 11
