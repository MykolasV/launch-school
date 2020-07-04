factorials = Enumerator.new do |list|
  list << 1

  number = 1
  loop do
    multiplier = number - 1
    factorial = number
    while multiplier > 0
      factorial = factorial * multiplier
      multiplier -= 1
    end

    list << factorial
    number += 1
  end
end

# using external iterator

7.times { puts factorials.next }

puts '----------'

factorials.rewind

# using internal iterator

factorials.each_with_index do |factorial, index|
  break if index >= 7
  puts "Factorial of #{index} is #{factorial}."
end

puts '----------'

# Given solution

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end
