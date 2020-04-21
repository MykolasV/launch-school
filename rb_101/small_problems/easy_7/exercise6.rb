def staggered_case(string)
  alphabet = ('A'..'Z').to_a.zip(('a'..'z').to_a).flatten
  result = ''

  need_upper = true
  string.chars.each do |char|
    if !alphabet.include?(char)
      result += char
      next
    end

    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end

  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
puts '-----'

# Further exploration:

def staggered_case(string, count_non_alph = true)
  alphabet = ('A'..'Z').to_a.zip(('a'..'z').to_a).flatten
  result = ''

  need_upper = true
  string.chars.each do |char|
    if count_non_alph == false
      if !alphabet.include?(char)
        result += char
        next
      end
    end

    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end

  result
end

puts 'Counting non-alphabetic characters:'
p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS')
p staggered_case('ignore 77 the 444 numbers')
puts ''
puts 'Ignoring non-alphabetic characters:'
p staggered_case('I Love Launch School!', count_non_alph = false)
p staggered_case('ALL CAPS', count_non_alph = false)
p staggered_case('ignore 77 the 444 numbers', count_non_alph = false)
