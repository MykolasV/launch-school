class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    self.class.to(limit, @divisors)
  end

  def self.to(limit, divisors = [3, 5])
    numbers = (0...limit).select do |number|
                divisors.any? { |divisor| number % divisor == 0 }
              end
    numbers.reduce(&:+)
  end
end
