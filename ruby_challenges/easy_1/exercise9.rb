class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    sum_of_factors = (1..number/2).select { |divisor| number % divisor == 0 }.sum

    if sum_of_factors == number
      'perfect'
    elsif sum_of_factors > number
      'abundant'
    else
      'deficient'
    end
  end
end
