module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

small_car = Car.new
small_car.go_fast

# on line 3, within the string interpolation, 'self' returns the calling object
# (instance of some class), then the #class method is chained and called on that
# return value, which then returns the class which that object belongs to.
# The value is then used for string interpolation.
