def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

puts ''

# Further exploration:

def palindromic?(arg)
  arg.reverse == arg
end

p palindromic?(%w(m a d a m)) == true
p palindromic?('Madam') == false
p palindromic?(%w(m a d a m i ' m a d a m)) == false
p palindromic?('356653') == true
