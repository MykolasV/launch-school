class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.count
  end
end

class Shelter

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    if @adoptions.has_key?(owner.name)
      @adoptions[owner.name] << "a #{pet.type} named #{pet.name}"
    else
      @adoptions[owner.name] = ["a #{pet.type} named #{pet.name}"]
    end

    owner.add_pet(pet)
  end

  def print_adoptions
    @adoptions.each_key do |owner|
      puts "#{owner} has adopted the following pets:"
      @adoptions[owner].each do |pet|
        puts pet
      end
      puts ''
    end
  end

end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

puts '-----'

# ----- Given Solution -----

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

puts '-----'

# Further exploration:

# ----------

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.count
  end
end

class Shelter

  def initialize
    @adoptions = {}
    @shelter_pets = []
  end

  def adopt(owner, pet)
    if @adoptions.has_key?(owner.name)
      @adoptions[owner.name] << "a #{pet.type} named #{pet.name}"
    else
      @adoptions[owner.name] = ["a #{pet.type} named #{pet.name}"]
    end

    owner.add_pet(pet)
    @shelter_pets.delete(pet)
  end

  def print_adoptions
    @adoptions.each_key do |owner|
      puts "#{owner} has adopted the following pets:"
      @adoptions[owner].each do |pet|
        puts pet
      end
      puts ''
    end
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    @shelter_pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
    puts ''
  end

  def add_to_shelter(pet)
    @shelter_pets << pet
  end

end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta       = Pet.new('dog', 'Asta')
laddie     = Pet.new('dog', 'Laddie')
fluffy     = Pet.new('cat', 'Fluffy')
kat        = Pet.new('cat', 'Kat')
ben        = Pet.new('cat', 'Ben')
chatterbox = Pet.new('parakeet', 'Chatterbox')
bluebell   = Pet.new('parakeet', 'Bluebell')

beta     = Pet.new('dog', 'Beta')
baitas   = Pet.new('dog', 'Baitas')
kaciukas = Pet.new('cat', 'Kaciukas')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
mykolas = Owner.new('Mykolas')

shelter = Shelter.new

[ butterscotch, pudding, darwin,
  kennedy, sweetie, molly, chester,
  asta, laddie, fluffy, kat, ben, 
  chatterbox, bluebell, beta, baitas, kaciukas].each do |pet|
                                                  shelter.add_to_shelter(pet)
                                                end

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(mykolas, beta)
shelter.adopt(mykolas, baitas)
shelter.adopt(mykolas, kaciukas)

shelter.print_unadopted_pets
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{mykolas.name} has #{mykolas.number_of_pets} adopted pets."
