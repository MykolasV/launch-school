def prompt(message)
  puts "==> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number && !number.start_with?(' ')
end

def retrieve_number
  loop do
    number = gets.chomp
    return number if valid_number?(number)
    prompt("Invalid input. Please try again.")
  end
end

numbers = []
places = ['1st', '2nd', '3rd', '4th', '5th', 'last']

loop do
  places.each do |place|
    prompt("Enter the #{place} number:")
    number = retrieve_number
    numbers << number.to_i
  end

  break if numbers.length == places.length
end

last_number = numbers.pop

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers.inspect}."
else
  puts "The number #{last_number} does not appear in #{numbers.inspect}."
end
