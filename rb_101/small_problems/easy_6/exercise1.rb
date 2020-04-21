DEGREE = "\xC2\xB0"
MINUTE = "'"
SECOND = "\""

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(degrees)
  total_minutes = (degrees * MINUTES_PER_DEGREE)
  degrees, minutes = total_minutes.divmod(MINUTES_PER_DEGREE)
  remaining_total_seconds = minutes * SECONDS_PER_MINUTE
  minutes, seconds = remaining_total_seconds.divmod(SECONDS_PER_MINUTE)

  degrees.to_s + DEGREE + format('%0.2d', minutes.round(2)) + MINUTE +
  format('%0.2d', seconds.round(2)) + SECOND
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Given solution:

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further exploration:

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
MAX_DEGREE = 360

def dms(degrees_float)
  if degrees_float > MAX_DEGREE
    until degrees_float <= MAX_DEGREE
      degrees_float -= MAX_DEGREE
    end
  elsif degrees_float < 0
    until degrees_float > 0
      degrees_float += MAX_DEGREE
    end
  end
  
  # could replace with:
  # degrees_float = degrees_float % MAX_DEGREE

  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
