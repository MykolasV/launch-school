class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    upcased_name = @name.upcase
    "My name is #{upcased_name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

puts '-----'

# Further exploration:

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# the integer referenced by name was passed in and converted to a string when
# fluffy was initialized. name and @name now reference different objects.

# name += 1 is irrelevant to fluffy since its initialization as name and @name
# point to different objects, and even if it was, name += 1 is reassignment
# which is not mutating; also, integers are immutable in Ruby.
