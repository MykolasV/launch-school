class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
  
  def play
    "Start the game of Bingo!"
  end
end

puts Bingo.new.play

# Bingo#play method overrides #play method defined in Game class.
