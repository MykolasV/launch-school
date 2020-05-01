module Prompt
  def prompt(message)
    puts ">> #{message}"
  end
end

class Score
  include Prompt

  attr_reader :player1, :player2, :current

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    reset
  end

  def reset
    @current = { player1 => 0, player2 => 0 }
  end

  def display
    puts ' SCORE '.center(40, '=')
    prompt("#{player1.name}: #{current[player1]}")
    prompt("#{player2.name}: #{current[player2]}")
  end

  def update
    current[winner] += 1 if current.key?(winner)
  end

  def display_winner
    case winner
    when player1   then prompt("#{player1.name} won!")
    when player2   then prompt("#{player2.name} won!")
    else                prompt("It's a tie!")
    end
  end

  def display_grand_winner
    prompt("Congratulations #{grand_winner}! You are the grand winner!!!")
  end

  private

  def winner
    determine_winner
  end

  def determine_winner
    if player1.move > player2.move
      player1
    elsif player1.move < player2.move
      player2
    else
      'tie'
    end
  end

  def grand_winner
    determine_grand_winner
  end

  def determine_grand_winner
    current[player1] == RPSGame::MAX_POINTS ? player1.name : player2.name
  end
end

class Rock
  attr_reader :name

  def initialize
    @name = 'rock'
  end

  def beats?(move)
    ['lizard', 'scissors'].include?(move.name)
  end
end

class Paper
  attr_reader :name

  def initialize
    @name = 'paper'
  end

  def beats?(move)
    ['rock', 'spock'].include?(move.name)
  end
end

class Scissors
  attr_reader :name

  def initialize
    @name = 'scissors'
  end

  def beats?(move)
    ['paper', 'lizard'].include?(move.name)
  end
end

class Lizard
  attr_reader :name

  def initialize
    @name = 'lizard'
  end

  def beats?(move)
    ['spock', 'paper'].include?(move.name)
  end
end

class Spock
  attr_reader :name

  def initialize
    @name = 'spock'
  end

  def beats?(move)
    ['scissors', 'rock'].include?(move.name)
  end
end

class Move
  attr_reader :value

  VALUES = [Rock, Paper, Scissors, Lizard, Spock]

  def initialize(value)
    @value = value.new
  end

  def >(other)
    value.beats?(other.value)
  end

  def <(other)
    other > self
  end

  def to_s
    value.name
  end
end

class Player
  include Prompt

  attr_reader :name, :move, :history

  def initialize
    @history = []
  end

  private

  attr_writer :name, :move
end

class Human < Player
  def choose
    choice = nil
    loop do
      prompt('Type "1" for "rock", "2" for "paper", "3" for "scissors", ')
      prompt('"4" for "lizard" or "5" for "spock"')
      choice = gets.chomp
      break if [*1..5].map(&:to_s).include?(choice)
      prompt("Invalid input!")
    end

    self.move = Move.new(Move::VALUES[choice.to_i - 1])
    history << move.to_s
  end

  def set_name
    prompt("What's your name?")
    name = ''
    loop do
      name = gets.chomp
      break unless name.empty? || name.start_with?(' ') || name.end_with?(' ')
      prompt("Oops! Seems like there was a mistake. Try again!")
    end
    self.name = name.capitalize
  end
end

class Computer < Player
  NAMES = ['James', 'Peter', 'Jenny', 'Bob', 'Sarah']

  PERSONALITIES = NAMES.each_with_object({}) do |name, hash|
    length_of_choices = (NAMES.index(name) + 1)
    hash[name] = Move::VALUES[0, length_of_choices]
  end

  def choose
    self.move = Move.new(PERSONALITIES[name].sample)
    history << move.to_s
  end

  def set_name
    self.name = NAMES.sample
  end
end

class RPSGame
  include Prompt

  attr_reader :human, :computer, :score

  MAX_POINTS = 5

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new(human, computer)
  end

  def play
    introduction
    loop do
      gameplay
      filler
      break unless play_again?
      score.reset
    end
    clear
    display_moves_history
    display_goodbye_message
  end

  private

  def filler
    puts '-' * 40
  end

  def clear
    system('clear') || system('cls')
  end

  def display_welcome_message
    prompt("Welcome to << Rock, Paper, Scissors, Lizard, Spock >>")
  end

  def set_names
    human.set_name
    computer.set_name
  end

  def greet
    prompt("Hello #{human.name}, you will be playing against " \
      "#{computer.name} today!")
    filler
    prompt("The first to reach #{MAX_POINTS} points will be the grand winner!")
    prompt("Good luck!")
  end

  def introduction
    clear
    display_welcome_message
    set_names
    clear
    greet
    sleep(5)
    clear
  end

  def display_choices
    clear
    prompt("#{human.name} chose #{human.move}")
    prompt("#{computer.name} chose #{computer.move}")
    filler
  end

  def scores
    score.display_winner
    score.update
    score.display
    sleep(4)
  end

  def max_wins?
    score.current.any? { |_player, points| points == MAX_POINTS }
  end

  def play_again?
    prompt("Would you like to play again?")

    answer = ''
    loop do
      prompt("'y' if yes, 'n' if no")
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      prompt("Invalid input!")
    end

    answer == 'y'
  end

  def display_moves_history
    all_moves = human.history.zip(computer.history)

    prompt("History of moves:")
    all_moves.each do |moves|
      prompt("#{human.name}: #{moves.first}, #{computer.name}: #{moves.last}")
      sleep(1)
    end
    filler
  end

  def gameplay
    loop do
      clear
      human.choose
      computer.choose
      display_choices
      scores
      break if max_wins?
    end
    filler
    score.display_grand_winner
  end

  def display_goodbye_message
    prompt("Thank you for playing << Rock, Paper, Scissors, Lizard, Spock >>")
    prompt("Good bye!")
  end
end

RPSGame.new.play
