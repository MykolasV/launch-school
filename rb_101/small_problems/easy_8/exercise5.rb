def substrings_at_start(string, start_idx)
  substrings = []
  start_idx.upto(string.size - 1) do |end_idx|
    substrings << string[start_idx..end_idx]
  end
  substrings
end

def substrings(string)
  all_substrings = []
  0.upto(string.size - 1) do |start_idx|
    all_substrings << substrings_at_start(string, start_idx)
  end
  all_substrings.flatten
end

def palindrome?(string)
  string.length > 1 && string == string.reverse
end

def palindromes(string)
  substrings(string).select { |str| palindrome?(str) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

puts '-----'

# Further exploration:

def palindrome?(string)
  string = string.downcase
  string.length > 1 && string == string.reverse
end

def palindromes(string)
  string = string.delete('^a-zA-Z0-9')
  all_substrings = substrings(string)
  all_substrings.select { |str| palindrome?(str) }
end

p palindromes('abc@d') == []
p palindromes('Mad&am') == ["Madam", "ada"]
p palindromes('heLlo-madam-did-madam-gOodbye *&%$985&^89') == ["Ll", "madam",
  "madamdidmadam", "ada", "adamdidmada", "damdidmad", "amdidma", "mdidm",
  "did", "madam", "ada", "Oo",
  "98589", "858"]
p palindromes('kniT-----ting 9-^9 -^%~- casSettes') == ["niTtin", "iTti", "Tt",
  "99", "sS", "Settes", "ette", "tt"]
