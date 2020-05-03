class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

new_cube = Cube.new(20)
p new_cube.volume

# Given solution:

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

big_cube = Cube.new(5000)
p big_cube.get_volume

# or

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# nothing added to the class

big_cube = Cube.new(5000)
p big_cube.instance_variable_get("@volume")
