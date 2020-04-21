def balanced?(string)
  parentheses = string.chars.select { |char| ['(', ')'].include?(char) }

  first_idx = 0
  last_idx = parentheses.size - 1
  loop do
    break if first_idx > last_idx

    if parentheses[first_idx] == ')' && parentheses[first_idx - 1] != '(' ||
       parentheses[last_idx] == '(' && parentheses[last_idx + 1] != ')'
      return false
    end

    first_idx += 1
    last_idx -= 1
  end

  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
puts '-----'

# Given solution:

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
puts '-----'

# Further exploration:

def balanced?(string)
  matching_chars = ['()', '[]', '{}', '""', "''"]
  matches = nil
  matching_chars.each do |matching_char|
    matches = 0
    string.each_char do |char|
      matches += 1 if char == matching_char[0]
      matches -= 1 if char == matching_char[1]
      break if matches < 0
    end
    return false if matches != 0
  end

  true
end

p balanced?('What (is) this?') == true
p balanced?('What [is] (this)') == true
p balanced?('[What] is {this}') == true
p balanced?('{What} "is" this') == true
p balanced?("(What 'is' \"this\")") == true
