def stringy(num, start = 1)
  str = ''
  
    if start == 1
      until str.length == num 
        str << '1'
        next if str.length == num
        str << '0'
      end
    elsif start == 0 
      until str.length == num 
        str << '0'
        next if str.length == num
        str << '1'
      end 
    else 
      return "Invalid second argument, choose either 0 or 1!"
    end
    
  str
end 

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts '------'
puts stringy(8, 1)
puts stringy(10, 0)
puts stringy(5, 5)
