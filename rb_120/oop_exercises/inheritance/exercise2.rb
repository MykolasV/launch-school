class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
    start_engine
  end
  
  def start_engine
    puts 'Ready to go!'
  end
end

class Truck < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

# Given solution:

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
