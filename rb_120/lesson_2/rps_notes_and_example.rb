# Approach to OOP
# The classical approach to object oriented programming is:
# 1. Write a textual description of the problem or exercise.
# 2. Extract the major nouns and verbs from the description.
# 3. Organize and associate the verbs with the nouns.
# 4. The nouns are the classes and the verbs are the behaviors or methods.

# step 1:
# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:
#
# - rock beats scissors
# - scissors beats paper
# - paper beats rock
#
# If the players chose the same move, then it's a tie.

# step 2:
# Nouns: player, move, rule
# Verbs: choose, compare

# step 3:
# Player
#  - choose
# Move
# Rule
#
# - compare

# step 4:
# class Player
#   def initialize
#     # name? move?
#   end
# 
#   def choose
# 
#   end
# end

# class Move
#   def initialize
#     # something to keep track of the choice
#     # a Move object can be 'paper', 'rock', or scissors
#   end
# end

# class Rule
#   def initialize
#     # not sure what the state of the Rule object should be
#   end
# end


# not sure where 'compare' goes yet
# def compare(move1, move2)
# 
# end

# Orchestration Engine:
# After we're done organizing nouns and verbs into classes, we need an "engine"
# of some sort to orchestrate the objects. This is where the procedural program
# flow should be. Let's call the "engine" class RPSGame. We want an easy
# interface to kick things off, so perhaps to play the game, we just instantiate
# an object and call a method called play, like this:

# RPSGame.new.play

# Given that interface, we can start to take a stab at the class definition:

# class RPSGame
#   def initialize
# 
#   end
# 
#   def play
# 
#   end
# end

# Starting from that skeleton, we can start to think about what objects are
# required in the play method to facilitate the game:

# def play
#   display_welcome_message
#   human_choose_move
#   computer_choose_move
#   display_winner
#   display_goodbye_message
# end

# human_choose_move and computer_choose_move look similar, and it also looks
# like there's a redundant "choose_move" part. This ties into our Player class,
# which has a choose method. What if "human" and "computer" were both objects
# of the Player class? They'd both immediately have the Player#choose method.
# With that insight, we update the RPSGame class definition:

# class RPSGame
#   attr_accessor :human, :computer
# 
#   def initialize
#     @human = Player.new
#     @computer = Player.new
#   end
# 
#   def play
#     display_welcome_message
#     human.choose
#     computer.choose
#     display_winner
#     display_goodbye_message
#   end
# end

# The objects are starting to take shape. There's still the question of how to
# use the Move class and the Rule class in our game. Or maybe those classes
# aren't even needed at all?

# ======================

# Given solution:

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['RD2D', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must by y or n."
    end
    answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
