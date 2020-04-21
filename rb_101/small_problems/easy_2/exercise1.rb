puts "Who's age would you like to find out?"
person = gets.chomp

age = rand(20..200)

if person.empty?
  puts "Teddy is #{age} years old!"
else
  puts "#{person} is #{age} years old!"
end
