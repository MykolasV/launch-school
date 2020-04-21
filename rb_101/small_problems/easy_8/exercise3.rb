def substrings_at_start(string)
  substrings = []

  end_idx = 0
  loop do
    break if end_idx == string.size
    substrings << string[0..end_idx]
    end_idx += 1
  end

  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
puts '-----'

# Or:

def substrings_at_start(string)
  substrings = []

  0.upto(string.size - 1) do |end_idx|
    substrings << string[0..end_idx]
  end

  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
puts '-----'

# Or:

def substrings_at_start(string)
  accumulator_str = ''
  string.chars.each_with_object([]) do |char, arr|
    accumulator_str += char
    arr << accumulator_str
  end
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
