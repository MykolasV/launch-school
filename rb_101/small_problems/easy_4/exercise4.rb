def leap_year?(year)
  if year > 1752
    (year % 4).zero? && !(year % 100).zero? || (year % 400).zero?
  else
    (year % 4).zero?
  end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Further exploration:

# In the Ancient Lithuania the moon calendar was used. With the development of
# agriculture eventually the sun calendar was adopted. Since the 13th century
# The Julian calendar was used in the Grand Duchy of Lithuania. The Gregorian 
# calendar was adopted by the Polish-Lithuanian Commonwealth in 1586,
# a few years after its promulgation in 1582 by Pope Gregory XIII.
# In 1800, following Lithuania's annexation by the Russian Empire,
# the Julian calendar again became the norm, although a part of ethnic
# Lithuania left of Nemunas River (Suvalkija) retained the Gregorian calendar.
# The Russian Revolution of 1917 re-instated the Gregorian calendar,
# which had been the Western European standard for over a century,
# in January 1918.
