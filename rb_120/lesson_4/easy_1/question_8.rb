class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# the 'self' on line 10, refers to the instance of the class Cat - object which
# invoked make_one_year_older method.

# make_one_year_older is an instance method and can only be called on instances
# of the class Cat.
