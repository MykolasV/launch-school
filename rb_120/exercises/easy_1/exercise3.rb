class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further exploration:

# attr_reader gives us a getter method which allows us to retrieve the value
# referenced by a given instance variable.

# attr_writer gives us a setter method which allows us to reassign a given
# instance variable to a different value.

# attr_accessor gives us a getter and a setter method.

# attr_reader was used in the given code because only a getter method was
# necessary.

# If we substituted attr_reader with the following code:

  # def title
  #   @title
  # end
  
  # def author
  #   @author
  # end
  
# we would get the same results.

# The only advantage of the substitute code example would be if we wanted to
# manipulate the value for the output, in which case we could easily do that
# within those methods, whereas this is not possible with *attr.
