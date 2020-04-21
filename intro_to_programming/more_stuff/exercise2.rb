def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# => Nothing is printed because the block doesn't have the .call method
# => returns a Proc object
