def count_letter_case(string, letter_case)
  letters = letter_case == 'upper' ? ('A'..'Z') : ('a'..'z')
  string.chars.select { |char| letters.include?(char) }.size
end

def determine_percentage(letter_case_count, string)
  percentage = (letter_case_count * 100) / string.size.to_f
  percentage.round == percentage ? percentage.round : percentage
end

def letter_percentages(string)
  percentages = {}
  lowercase = count_letter_case(string, 'lower')
  uppercase = count_letter_case(string, 'upper')
  neither = string.size - (lowercase + uppercase)

  percentages[:lowercase] = determine_percentage(lowercase, string)
  percentages[:uppercase] = determine_percentage(uppercase, string)
  percentages[:neither] = determine_percentage(neither, string)

  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts '-----'

# Given solution:

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts '-----'

# Further exploration:

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = ((counts[:uppercase] / length.to_f) * 100).round(2)
  percentages[:lowercase] = ((counts[:lowercase] / length.to_f) * 100).round(2)
  percentages[:neither] = ((counts[:neither] / length.to_f) * 100).round(2)
end

p letter_percentages('abcdefGHI')
