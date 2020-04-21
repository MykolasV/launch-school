def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  lowercase_alphabet  = ('a'..'z')
  uppercase_alphabet  = ('A'..'Z')

  string.chars do |char|
    if lowercase_alphabet.include?(char)
      result[:lowercase] += 1
    elsif uppercase_alphabet.include?(char)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
puts '-----'

# Or:

def uppercase?(char)
  ('A'..'Z').include?(char)
end

def lowercase?(char)
  ('a'..'z').include?(char)
end

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars do |char|
    case
    when lowercase?(char) then result[:lowercase] += 1
    when uppercase?(char) then result[:uppercase] += 1
    else                       result[:neither] += 1
    end
  end

  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
puts '-----'

# Given Solution 2:

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
