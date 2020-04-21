def get_grade(grade_1, grade_2, grade_3)
  average = (grade_1 + grade_2 + grade_3) / 3

  case
  when (0..59).include?(average)  then 'F'
  when (60..69).include?(average) then 'D'
  when (70..79).include?(average) then 'C'
  when (80..89).include?(average) then 'B'
  else                                      'A'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
puts '-----'

# Or:

def get_grade(grade_1, grade_2, grade_3)
  average = (grade_1 + grade_2 + grade_3) / 3

  if average >= 90
    'A'
  elsif average >= 80
    'B'
  elsif average >= 70
    'C'
  elsif average >= 60
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
puts '-----'

# Given solution:

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
puts '-----'

# Further exploration:

def get_grade(s1, s2, s3, extra = [])
  divisor = 3 + extra.size
  result = (s1 + s2 + s3 + extra.sum)/divisor

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95, extra = [90]) == 'C'
p get_grade(95, 90, 70, extra = [78, 69, 92]) == 'B'
