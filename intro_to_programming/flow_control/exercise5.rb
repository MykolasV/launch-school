def range(number)
  case number
  when 0..50 
    puts number.to_s + ' is between 0 and 50.'
  when 51..100 
    puts number.to_s + ' is between 51 and 100.'
  else
    if number < 0
      puts 'Please provide a positive number.'
    else
      puts number.to_s + ' is above 100.'
    end 
  end
end


puts 'Please provide a number between 0 and 100.'

number = gets.chomp.to_i

range(number)
