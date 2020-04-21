def friday_13th(year)
  occurrences = 0
  (1..12).each do |month|
    occurrences += 1 if Time.new(year, month, 13).friday?
  end

  occurrences
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
puts '-----'

# Given solution:

require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
puts '-----'

# Further exploration:

# A month will have five fridays if:
# it has 31 days and starts on wednesday, thursday, or friday.
# it has 30 days and starts on thursday or friday.
# it has 29 days and starts on friday.

def five_fridays(year)
  occurrences = 0
  (1..12).each do |month|
    number_of_days = Date.new(year, month, -1).mday
    first_weekday = Date.new(year, month, 1).wday

    if number_of_days == 31 && [3, 4, 5].include?(first_weekday) ||
       number_of_days == 30 && [4, 5].include?(first_weekday) ||
       number_of_days == 29 && first_weekday == 5
      occurrences += 1
    end
  end

  occurrences
end

p five_fridays(2020) == 4
p five_fridays(2004) == 5
