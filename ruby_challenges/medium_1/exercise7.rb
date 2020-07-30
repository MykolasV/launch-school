class Meetup
  WEEKDAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday,
              :friday, :saturday]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def select_weekday(range, weekday)
    range.detect do |day|
      Date.new(@year, @month, day).wday == WEEKDAYS.index(weekday)
    end
  end

  def day(weekday, schedule)
    _day = case schedule
          when :first
            select_weekday(1..7, weekday)
          when :second
            select_weekday(8..14, weekday)
          when :third
            select_weekday(15..21, weekday)
          when :fourth
            select_weekday(22..28, weekday)
          when :last
            last_day_of_the_month = Date.new(@year, @month, -1).day
            last_week_range = (last_day_of_the_month - 6)..last_day_of_the_month
            select_weekday(last_week_range, weekday)
          when :teenth
            select_weekday(13..19, weekday)
          end

    Date.new(@year, @month, _day)
  end
end

# Given solution

# class Meetup
#   def initialize(month, year)
#     @month = month
#     @year = year
#     @schedule_start_day = {
#       first: 1,
#       second: 8,
#       third: 15,
#       fourth: 22,
#       last: -7,
#       teenth: 13
#     }
#   end

#   def day(weekday, schedule)
#     first_day = Date.new(@year, @month, @schedule_start_day[schedule])
#     (first_day..(first_day + 6)).detect {|day| day.public_send(weekday.to_s + '?')}
#   end
# end
