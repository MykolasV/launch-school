def execute(block)  # the argument has to start with '&' as in '&block' in order to be passed in as a block.
  block.call
end

execute { puts "Hello from inside the execute method!" }
