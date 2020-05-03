class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new  # => new instance of class Television created
tv.manufacturer      # => error, no such instance method
tv.model             # => return value of instance method 'model'

Television.manufacturer  # => return value of class method 'manufacturer'
Television.model         # => error, no such class method
