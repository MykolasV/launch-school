WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

MAX_WINS = 5

FIRST_PLAYER = 'choose'

def prompt(msg)
  puts "=> #{msg}"
end

def filler
  puts '-' * 40
end

def clear
  system('clear') || system('cls')
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, delimiter = ', ', word = 'or')
  return array.first.to_s if array.size == 1
  return "#{array.first} #{word} #{array.last}" if array.size == 2

  result = ''
  array.each_with_index do |item, idx|
    result += idx == array.size - 1 ? "#{word} #{item}" : "#{item}#{delimiter}"
  end

  result
end

def player_places_piece!(brd)
  prompt("It's your turn.")

  square = ''
  loop do
    prompt("Choose a square #{joinor(empty_squares(brd))}:")
    square = gets.chomp
    break if empty_squares(brd).map(&:to_s).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square.to_i] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def attack_square(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  square
end

def defend_square(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end

  square
end

def take_five(brd)
  5 if brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  square = attack_square(brd) || defend_square(brd) || take_five(brd)

  square = empty_squares(brd).sample unless square

  prompt("Computer's turn...")
  sleep(2)
  brd[square] = COMPUTER_MARKER
end

def determine_first_move(player)
  player == 'choose' ? retrieve_first_player_option : player
end

def retrieve_first_player_option
  option = ''
  loop do
    prompt("Who goes first: player or computer?" \
      " ('p' for player, 'c' for computer)")
    option = gets.chomp.downcase
    break if %w(p c).include?(option)
    prompt("Invalid input. Please try again.")
  end

  option == 'p' ? 'player' : 'computer'
end

def game_play(brd, current_player)
  loop do
    display_board(brd)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(brd) || board_full?(brd)
  end

  display_board(brd)
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end

def detect_grand_winner(score)
  score.keys.select { |key| score[key] == MAX_WINS }.join
end

def grand_winner?(score)
  score['Player'] == MAX_WINS || score['Computer'] == MAX_WINS
end

def play_again?
  prompt("Play again? ('y' or 'n')")

  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if %w(y n).include?(answer)
    prompt("Invalid input. Please type in 'y' to play again or 'n' to quit.")
  end

  answer == 'y'
end

clear
prompt("Welcome to Tic Tac Toe!")

loop do
  prompt("The first to reach #{MAX_WINS} wins will be the grand winner.")
  filler

  score = { 'Player' => 0, 'Computer' => 0 }
  current_player = determine_first_move(FIRST_PLAYER)

  loop do
    break if grand_winner?(score)

    board = initialize_board
    game_play(board, current_player)

    if someone_won?(board)
      filler
      prompt("#{detect_winner(board)} won!")
      score[detect_winner(board)] += 1
    else
      filler
      prompt("It's a tie!")
    end

    prompt("Player: #{score['Player']}, Computer: #{score['Computer']}.")
    filler
    current_player = alternate_player(current_player) # take turn every round
    sleep(3)
  end

  prompt("The grand winner is #{detect_grand_winner(score)}!")

  filler
  break unless play_again?
  clear
end

prompt("Thanks for playing Tic Tac Toe! Good bye!")
