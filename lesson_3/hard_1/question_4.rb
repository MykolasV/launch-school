def is_an_ip_number?(str)
  (0..255).include?(str.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) 
  end

  true
end

p dot_separated_ip_address?("10.4.5.11")    # => true
p dot_separated_ip_address?("4.5.5")        # => false (too short)
p dot_separated_ip_address?("1.2.3.4.5")    # => false (too long)
p dot_separated_ip_address?("35.256.12.79") # => false (includes number > 255)
