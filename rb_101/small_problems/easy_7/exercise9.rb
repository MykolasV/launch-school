def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |arr| arr.inject(&:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts '-----'

# Or:

def multiply_all_pairs(array_1, array_2)
  result = []

  0.upto(array_1.size - 1) do |idx_1|
    0.upto(array_2.size - 1) do |idx_2|
      result << array_1[idx_1] * array_2[idx_2]
    end
  end

  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts '-----'

# Given solutions:

# 1:

def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts '-----'

# 2:

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
