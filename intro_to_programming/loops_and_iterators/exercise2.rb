input = ''

while input != 'STOP' do 
  puts "Give me a number and I'll double it"
  number = gets.chomp.to_i
  puts "#{number * 2}" 
  puts "Do it again?(else type 'STOP')" 
  input =gets.chomp
end 
