class Prime
  def self.nth(target)
    raise ArgumentError if target <= 0

    primes = [2]
    num = 3
    while primes.size < target
      primes << num unless primes.any? { |divisor| num % divisor == 0 }
      num += 2
    end

    primes.last
  end
end
