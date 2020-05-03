class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# the class Pizza has an instance variable @name. Instance variable names are
# always prefixed with @ sign.

# we can also ask an object of that class if it has instance variables

hot_pizza = Pizza.new('cheese')
orange    = Fruit.new('apple')

# like this:

p hot_pizza.instance_variables
p orange.instance_variables
