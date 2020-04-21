MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  time    = time.split(':')
  hours   = time[0].to_i
  minutes = time[1].to_i

  minutes = (hours * MINUTES_PER_HOUR) + minutes
  minutes % MINUTES_PER_DAY
end

def before_midnight(time)
  time    = time.split(':')
  hours   = time[0].to_i
  minutes = time[1].to_i

  minutes = (hours * MINUTES_PER_HOUR) + minutes
  return minutes if minutes == 0
  minutes = MINUTES_PER_DAY - minutes
  minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
puts '-----'

# Given solution:

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
puts '-----'

# Further exploration:

require 'time'

def after_midnight(time)
  time = Time.parse(time)
  (time.hour * MINUTES_PER_HOUR) + time.min
end

def before_midnight(time)
  minutes = MINUTES_PER_DAY - after_midnight(time)
  minutes = 0 if minutes == MINUTES_PER_DAY
  minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
