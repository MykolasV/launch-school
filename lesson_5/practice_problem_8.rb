hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |string|
    string.chars do |char|
      if ['A', 'a', 'E', 'e','I', 'i', 'O', 'o', 'U', 'u'].include?(char)
        puts char
      end
    end
  end
end

puts '-----'

# Or

hsh.each do |key, value|
  value.each do |string|
    string.chars do |char|
      puts char if char.count('AaEeIiOoUu') > 0
    end
  end
end

puts '-----'

# Given solution:

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
