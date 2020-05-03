class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

# Each time predict_the_future method is called, a string will be returned in
# the form of "You will <something>", where the something is one of the 3
# phrases defined in the array returned by the choices method defined in the
# Roadtrip class. The specific string will be chosen randomly.

# Oracle#choices is not called because Roadtrip#choice overrides it.
