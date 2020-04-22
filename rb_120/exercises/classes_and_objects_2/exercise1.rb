class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further exploration:

kitty = Cat.new
kitty.class.generic_greeting

# => Hello! I'm a cat!

# the #class method called on the object kitty returns the class of the object,
# the class method ::generic_greeting is then invoked on the return value (class)
# of the previous method call.
