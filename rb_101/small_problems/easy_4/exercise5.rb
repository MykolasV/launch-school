def multiple?(number, divisor)
  (number % divisor).zero?
end

def multisum(max_num)
  sum = []

  for num in 1..max_num do
    if multiple?(num, 3) || multiple?(num, 5)
      sum << num
    end
  end

  sum.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
