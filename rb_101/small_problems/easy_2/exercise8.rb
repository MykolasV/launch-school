def prompt(message)
  puts ">> #{message}"
end

def valid_integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def valid_operation?(input)
  %w(s p).include?(input)
end

def retrieve_integer
  prompt('Please enter an integer greater than 0:')

  loop do
    integer = gets.chomp
    return integer if valid_integer?(integer)
    prompt('Please enter a valid integer.')
  end
end

def retrieve_operation
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")

  loop do
    operation = gets.chomp.downcase
    return operation if valid_operation?(operation)
    prompt("Invalid input. Please enter 's' fro sum or 'p' for product.")
  end
end

def perform_operation(operation, integer)
  if operation == 's'
    result = (1..integer).inject { |acc, elem| acc + elem }
  elsif operation == 'p'
    result = (1..integer).inject(1) { |acc, elem| acc * elem }
  end

  result
end

def display_result(integer, operation, result)
  if operation == 's'
    prompt("The sum of integers between 1 and #{integer} is #{result}")
  elsif operation == 'p'
    prompt("The product of integers between 1 and #{integer} is #{result}")
  end
end

def repeat?
  prompt("Would you like to make another calculation? \
('y' for yes, 'n' for no)")

  answer = ''
  loop do
    answer = gets.chomp
    break if %w(y n).include?(answer)
    prompt("Please enter 'y' for yes or 'n' for no")
  end

  answer == 'y'
end

loop do
  integer = retrieve_integer
  integer = integer.to_i

  operation = retrieve_operation

  result = perform_operation(operation, integer)

  display_result(integer, operation, result)

  puts '---------------------------------------'

  break unless repeat?
end
