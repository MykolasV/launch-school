class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    puts self
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

# Given solution:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi
