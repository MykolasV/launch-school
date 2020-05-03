class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

Cat.ancestors
# => [Cat, Animal, Object, Kernel, BasicObject]

# Ruby went down the list of all classes and modules, it couldn't find the
# method #color, therefore an error was thrown.
