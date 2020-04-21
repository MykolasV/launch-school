def fizzbuzz(start_num, end_num)
  nums = (start_num..end_num).to_a

  result = nums.map do |num|
    if num % 3 == 0 && num % 5 == 0
      'FizzBuzz, '
    elsif num % 3 == 0
      'Fizz, '
    elsif num % 5 == 0
      'Buzz, '
    else
      num.to_s + ', '
    end
  end

  result[-1].delete!(',')
  puts result.join
end

fizzbuzz(1, 15)

# Or:

def fizzbuzz(num1, num2)
  result = ''
  num1.upto(num2) do |num|
    case
    when (num % 3).zero? && (num % 5).zero? then result << 'FizzBuzz, '
    when (num % 3).zero? then result << 'Fizz, '
    when (num % 5).zero? then result << 'Buzz, '
    else                      result << num.to_s + ', '
    end
  end

  result.chomp!(', ')
  puts result
end

fizzbuzz(1, 15)

# Given solution:

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

fizzbuzz(1, 15)
