def repeater(string)
  result = ''
  string.chars { |char| result += char + char }
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
puts '-----'

# Or:

def repeater(string)
  string.chars.map { |char| char + char }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
puts '-----'

# Or:

def repeater(string)
  string.chars.each_with_object([]) do |char, arr|
    arr << char + char
  end.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
