def sum(num)
  arr = num.to_s.split('')
  
  result = 0
  arr.size.times { result += arr.delete(arr.first).to_i }
  result 
  
  
  # alternatively:
  
  # result = num.to_s.chars.collect(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
