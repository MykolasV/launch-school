def find_fibonacci_index_by_length(num)
  fibonacci_numbers = [1, 1]

  loop do
    first_number   = fibonacci_numbers[-2]
    second_number  = fibonacci_numbers[-1]
    second_number += first_number
    fibonacci_numbers << second_number
    break if fibonacci_numbers.last.to_s.length == num
  end

  fibonacci_numbers.index(fibonacci_numbers.last) + 1
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
puts '-----'

# Or:

def find_fibonacci_index_by_length(num)
  fibonacci_numbers = [1]

  first_num  = 0
  second_num = 1
  until fibonacci_numbers.last.to_s.length == num
    sum = first_num + second_num
    fibonacci_numbers.push(sum)
    first_num  = second_num
    second_num = sum
  end

  fibonacci_numbers.length
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
puts '-----'

# Given solution:

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
