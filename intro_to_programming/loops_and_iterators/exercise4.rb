def count_to_zero(num)
  puts num
  if num > 0
    count_to_zero(num - 1)
  end
end

count_to_zero(10)
