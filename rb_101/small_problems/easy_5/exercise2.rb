MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(total_minutes)
  before_midnight = total_minutes < 0

  total_minutes *= -1 if before_midnight
  total_minutes = MINUTES_PER_DAY - total_minutes if before_midnight

  hours, minutes = total_minutes.divmod(MINUTES_PER_HOUR)
  hours = hours % 24

  hours_string   = hours.to_s
  minutes_string = minutes.to_s

  hours_string.prepend('0') if hours < 10
  minutes_string.prepend('0') if minutes < 10
  "#{hours_string}:#{minutes_string}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
puts '-----'

# Given solution:

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
puts '-----'

# Further exploration:

def time_of_day(delta_minutes)
  sunday = Time.new(2019, 11, 17)

  delta_seconds = delta_minutes * 60
  hours   = Time.at(delta_seconds).hour
  minutes = Time.at(delta_seconds).min

  (sunday + delta_seconds).strftime("%A") + ' ' +
    format('%02d:%02d', hours, minutes)
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)
