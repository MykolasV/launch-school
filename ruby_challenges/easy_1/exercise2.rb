class Sieve
  MARKER = 'X'

  def initialize(limit)
    @range = [*2..limit]
    @status_of_numbers = @range.each_with_object({}) do |number, hash| 
                           hash[number] = ''
                         end
  end

  def marked?(number)
    @status_of_numbers[number] == MARKER
  end
  
  def mark!(number)
    @status_of_numbers[number] = MARKER
  end
  
  def mark_multiples_of(number)
    @status_of_numbers.each_key { |key| mark!(key) if key % number == 0 }
  end

  def primes
    result = []

    @range.each do |number|
      next if marked?(number)
      result << number
      mark_multiples_of(number)
    end

    result
  end
end

=begin
  algorithm:
    - initialize a result variable and assign an empty array to it
    - initialize a status_of_numbers variable and assign a hash to it, where
      each number from the range (key) is pointing to an empty string (value).
    - iterate through the range of numbers one by one
      - if a number points to 'X' in the status_of_numbers hash,
          skip the iteration
      - otherwise append it to the result array
        - then reassign the value of every multiple of it in status_of_numbers
          hash to 'X'
    - end of iterations
    - return result array
=end

#  Sieve.new(10).primes
