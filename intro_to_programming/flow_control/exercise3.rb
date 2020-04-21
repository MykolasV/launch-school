puts 'Please provide a number between 0 and 100.'

number = gets.chomp.to_i

if number < 0 
  puts 'Please provide a positive number.'
elsif number <= 50 
  puts number.to_s + ' is between 0 and 50.'
elsif number <= 100
  puts number.to_s + ' is between 51 and 100.'
else
  puts number.to_s + ' is above 100.'
end
