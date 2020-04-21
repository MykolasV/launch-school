def century(year)
  century = if year.to_s.chars.last == '0'
              year / 100
            else
              (year / 100) + 1
            end

  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_num = century.to_s.chars.last

  case last_num
  when '1' then 'st'
  when '2' then 'nd'
  when '3' then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10_103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11_201) == '113th'
