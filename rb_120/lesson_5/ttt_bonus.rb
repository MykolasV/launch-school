module Prompt
  def prompt(message)
    puts ">> #{message}"
  end
end

class Board
  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                          [1, 4, 7], [2, 5, 8], [3, 6, 9],
                          [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def [](sq)
    @squares[sq].marker
  end

  def []=(sq, marker)
    @squares[sq].mark(marker)
  end

  def display
    puts "         |         |"
    puts "    #{@squares[1]}    |    #{@squares[2]}    |    #{@squares[3]}"
    puts "_________|_________|_________"
    puts "         |         |"
    puts "    #{@squares[4]}    |    #{@squares[5]}    |    #{@squares[6]}"
    puts "_________|_________|_________"
    puts "         |         |"
    puts "    #{@squares[7]}    |    #{@squares[8]}    |    #{@squares[9]}"
    puts "         |         |"
  end

  def unmarked_squares
    @squares.keys.select { |sq| @squares[sq].unmarked? }
  end

  def winner_marker
    WINNING_COMBINATIONS.each do |combination|
      markers = @squares.values_at(*combination).select(&:marked?).map(&:marker)
      if markers.size == combination.size && markers.uniq.size == 1
        return markers.first
      end
    end
    nil
  end

  def got_winner?
    !!winner_marker
  end

  def full?
    unmarked_squares.empty?
  end

  def square_at_risk(marker)
    WINNING_COMBINATIONS.each do |combination|
      if combination.count { |sq| @squares[sq].marker == marker } == 2
        combination.each do |square|
          return square if unmarked_squares.include?(square)
        end
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_reader :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def mark(marker)
    self.marker = marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end

  private

  attr_writer :marker
end

class Score
  attr_reader :player1, :player2, :current

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    reset
  end

  def reset
    @current = { player1 => 0, player2 => 0 }
  end

  def update(marker)
    case marker
    when player1.marker then current[player1] += 1
    when player2.marker then current[player2] += 1
    end
  end

  # rubocop:disable Metrics/AbcSize
  def display
    width = 30

    puts " SCORE ".center(width, '=')
    puts ''
    puts "#{player1.name}: #{current[player1]}".center(width)
    puts "#{player2.name}: #{current[player2]}".center(width)
    puts ''
    puts '=' * width
  end
  # rubocop:enable Metrics/AbcSize

  def [](player)
    current[player]
  end
end

class Player
  attr_reader :name, :marker

  FIRST_MARKER = 'X'
  SECOND_MARKER = 'O'

  include Prompt

  private

  attr_writer :name, :marker
end

class Human < Player
  def assign_name
    prompt("What's your name?")
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty? || name.start_with?(' ')
      prompt("Please type in your name.")
    end
    self.name = name.strip.capitalize
  end

  def assign_marker
    prompt("Choose a marker: #{FIRST_MARKER} or #{SECOND_MARKER}")
    marker = nil
    loop do
      marker = gets.chomp.upcase
      break if [FIRST_MARKER, SECOND_MARKER].include?(marker)
      prompt("Invalid input. Please type in \"#{FIRST_MARKER}\" " \
        "or \"#{SECOND_MARKER}\".")
    end

    self.marker = marker
  end
end

class Computer < Player
  def assign_name
    name = ['James', 'George', 'Britney', 'Bob', 'Susie'].sample
    self.name = name
  end

  def assign_marker(other_player)
    self.marker = if other_player.marker == FIRST_MARKER
                    SECOND_MARKER
                  else
                    FIRST_MARKER
                  end
  end
end

class TTTGame
  MAX_POINTS = 3

  include Prompt

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @score = Score.new(human, computer)
    @first_to_move = nil # human or computer, or nil to prompt for choice
  end

  def play
    introduction_and_set_up
    loop do
      preamble
      gameplay
      display_grand_winner
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer, :score, :current_marker, :first_to_move

  attr_writer :current_marker, :first_to_move

  def clear
    system('clear') || system('cls')
  end

  def introduction_and_set_up
    clear
    display_welcome_message
    set_names
    clear
    greet
    set_markers
    choose_first_move unless current_marker
    clear
  end

  def display_welcome_message
    prompt("Welcome to Tic, Tac, Toe!")
  end

  def set_names
    human.assign_name
    computer.assign_name
  end

  def greet
    prompt("Hi #{human.name}, you will be playng against " \
      "#{computer.name} today!")
  end

  def set_markers
    human.assign_marker
    computer.assign_marker(human)
    self.current_marker = first_to_move.marker if first_to_move
  end

  def choose_first_move
    prompt('Would you like to go first? ("y" if yes, "n" otherwise)')

    loop do
      answer = gets.chomp.downcase
      if ['y', 'n'].include?(answer)
        self.first_to_move = answer == 'y' ? human : computer
        self.current_marker = first_to_move.marker
        break
      end
      prompt('Invalid input. Please type in "y" or "n".')
    end
  end

  def preamble
    prompt("Alright, the first to reach #{MAX_POINTS} " \
      "wins will be the grand winner!")
    prompt("Let's play!")
    sleep(4)
  end

  def play_round
    loop do
      clear
      display_board if human_turn?
      current_player_moves
      break if board.got_winner? || board.full?
    end
  end

  def gameplay
    loop do
      play_round
      update_and_display_results
      break if max_points_reached?
      after_round_reset
    end
  end

  def display_board
    puts " You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ''
    board.display
    puts ''
  end

  def joinor(array, delimiter = ',', connector = 'or')
    case array.size
    when 0 then ''
    when 1 then array.join
    when 2 then array.join(" #{connector} ")
    else
      array[0..-2].join("#{delimiter} ") + " #{connector} #{array[-1]}"
    end
  end

  def human_moves
    choice = nil
    loop do
      puts "Please choose a square: #{joinor(board.unmarked_squares)}"
      choice = gets.chomp
      break if board.unmarked_squares.map(&:to_s).include?(choice)
      puts "Sorry, that's not a valid option."
    end

    board[choice.to_i] = human.marker
  end

  def defend_square
    board.square_at_risk(human.marker)
  end

  def attack_square
    board.square_at_risk(computer.marker)
  end

  def computer_moves
    square = attack_square
    square = defend_square unless square
    square = 5 if board.unmarked_squares.include?(5) && !square
    square = board.unmarked_squares.sample unless square

    board[square] = computer.marker
  end

  def human_turn?
    current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = computer.marker
    else
      computer_moves
      self.current_marker = human.marker
    end
  end

  def display_winner
    case board.winner_marker
    when human.marker    then prompt("You won!")
    when computer.marker then prompt("Sorry, you lost...")
    else                      prompt("It's a tie!")
    end
  end

  def update_and_display_results
    display_board
    display_winner
    sleep(4)
    clear
    score.update(board.winner_marker)
    puts ''
    score.display
    sleep(4)
  end

  def max_points_reached?
    score[human] == MAX_POINTS || score[computer] == MAX_POINTS
  end

  def display_grand_winner
    puts ''
    if score[human] == MAX_POINTS
      prompt("Congratulations #{human.name}! You are the grand winner!")
    else
      prompt("#{computer.name} is the grand winner!")
    end
  end

  def play_again?
    puts ''
    prompt('Would you like to play again? ("y" if yes, "n" otherwise)')

    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      prompt('Invalid input! Please type in "y" or "n".')
    end

    answer == 'y'
  end

  def after_round_reset
    board.reset
    self.current_marker = first_to_move.marker
    clear
  end

  def reset
    after_round_reset
    score.reset
  end

  def display_goodbye_message
    prompt("Thank you for playing Tic, Tac, Toe!")
    prompt("Good bye!")
  end
end

game = TTTGame.new
game.play
