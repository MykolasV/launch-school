def leap_year?(year)
  (year % 4).zero? && !(year % 100).zero? || (year % 400).zero?
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240_000) == true
p leap_year?(240_001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

puts '-----'

# Further exploration:

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# # Will fail for:

p leap_year?(400)
p leap_year?(2000)
p leap_year?(240_000)
p leap_year?(2400)
