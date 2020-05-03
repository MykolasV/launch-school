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

# on line 10, 'self' refers to the Cat class. Method definitions prefixed with
# 'self.' are called 'class methods' and can only be called by the class itself.
