class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# @@cats_count is a class variable and keeps track of how many instances of the
# Cat class were created.

tom = Cat.new('pet')
p Cat.cats_count # => 1

kat = Cat.new('wild')
p Cat.cats_count # => 2
