def print_in_box(string)
  horizontal_rule = "+#{'-' * (string.length + 2)}+"
  empty_line      = "|#{' ' * (string.length + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
puts ''

# Further exploration:

def print_in_box(string)
  max_columns = 80
  valid_size  = max_columns - 4
  if string.length > valid_size
    (string.length - valid_size).times { string.chop! }
  end

  horizontal_rule = "+#{'-' * (string.length + 2)}+"
  empty_line      = "|#{' ' * (string.length + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To seek out new life and new civilizations. To boldly go where no one has gone before!')
puts ''

# Word wrap:

def split_string(string, length)
  result = []

  start_idx = 0
  end_idx   = length - 1
  loop do
    break if start_idx > string.length
    result << string[start_idx..end_idx]

    start_idx += length
    end_idx   += length
    end_idx = -1 if end_idx > string.length
  end

  result.each do |str|
    str.delete_prefix!(' ') if str.start_with?(' ')
  end

  result
end

def print_in_box(string, max_columns = 80)
  length = max_columns - 4
  length = string.length if string.length < length
  horizontal_rule = "+#{'-' * (length + 2)}+"
  empty_line      = "|#{' ' * (length + 2)}|"

  puts horizontal_rule
  puts empty_line

  if string.length <= length
    puts "| #{string} |"
  else
    strings = split_string(string, length)
    strings.each do |str|
      if str.length < length
        puts "| #{str} #{' ' * (length - str.length)}|"
      else
        puts "| #{str} |"
      end
    end
  end

  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Space: the final frontier. These are the voyages of the starship Enterprise. Its continuing mission: to explore strange new worlds. To seek out new life and new civilizations. To boldly go where no one has gone before!')
