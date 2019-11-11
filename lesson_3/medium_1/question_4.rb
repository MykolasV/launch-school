def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The first method will transform the first argument(buffer), so that once
# the method has finished executing, the return value and the provided first
# argument will be the same.

# The second method is different in that it will produce the same return value
# but will not mutate the first argument(input_array).
