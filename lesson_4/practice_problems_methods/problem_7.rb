[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 1
# => true

# The blocks return value is determined by the evaluation of the last line. If
# num.odd? returns true when called on an item, that will be the return value
# of the block, false otherwise.

# Since Enumerable#any? method returns true if at least one item in the
# collection is returned true by the block, this will be the result of this
# example.

# The method also exhibits a short-circuiting behaviour as it returns
# on the first iteration, since 1 returns true by num.odd?, there's no need to
# check the return values of the other items. We can see that when puts num
# is called only once, outputting 1.
