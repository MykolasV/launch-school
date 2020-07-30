class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def self.at(hours, minutes = 0)
    total_minutes = (hours * MINUTES_PER_HOUR) + minutes
    new(total_minutes)
  end

  attr_reader :total_minutes

  def initialize(total_minutes)
    @total_minutes = total_minutes
  end

  def +(minutes)
    @total_minutes += minutes
    self
  end

  def -(minutes)
    @total_minutes -= minutes
    self
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end

  def to_s
    @total_minutes = @total_minutes % MINUTES_PER_DAY
    hours, minutes = @total_minutes.divmod(MINUTES_PER_HOUR)

    format('%02d:%02d', hours, minutes)
  end
end
