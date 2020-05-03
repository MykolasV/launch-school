class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tom = AngryCat.new(6, 'Tom')
ben = AngryCat.new(4, 'Ben')

tom.name
tom.age
ben.name
ben.age
