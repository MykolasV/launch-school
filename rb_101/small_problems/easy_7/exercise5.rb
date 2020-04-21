def staggered_case(string)
  result = ''

  string.chars.each_with_index do |char, index|
    index.even? ? result << char.upcase : result << char.downcase
  end

  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts '-----'

# Or:

def staggered_case(string)
  result = ''

  idx = 0
  loop do
    break if idx == string.size
    current_char = string[idx].downcase
    current_char = current_char.upcase if idx.even?
    result << current_char
    idx += 1
  end

  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts '-----'

# Given solution:

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts '-----'

# Further exploration:

def staggered_case(string, first_char_upper = true)
  result = ''
  need_upper = first_char_upper
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')
puts 'Reversed:'
p staggered_case('I Love Launch School!', false)
p staggered_case('ALL_CAPS', false)
p staggered_case('ignore 77 the 444 numbers', false)
