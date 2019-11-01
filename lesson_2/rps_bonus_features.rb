VALID_CHOICES = %w(rock paper scissors lizard spock)
OPTIONS = <<-MSG
'r' for rock,
   'p' for paper,
   's' for scissors,
   'l' for lizard,
   'v' for spock
MSG

player_score   = []
computer_score = []

MAX_WINS = 5

def clear
  system('clear') || system('cls')
end

def filler
  puts "--------------------------------------"
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  moves = { 'scissors'  => ['paper', 'lizard'],
            'paper'     => ['rock', 'spock'],
            'rock'      => ['scissors', 'lizard'],
            'lizard'    => ['spock', 'paper'],
            'spock'     => ['scissors', 'rock'] }

  moves[first].include?(second)
end

def player_choice
  initials = %w(r p s l v)

  loop do
    input = gets.chomp.downcase
    return VALID_CHOICES[initials.index(input)] if initials.include?(input)
    clear
    prompt("That's not a valid choice.")
    prompt("Please choose:")
    prompt(OPTIONS)
  end
end

def results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def update_scores(result, player_score, computer_score)
  if result == "You won!"
    player_score << 1
  elsif result == "Computer won!"
    computer_score << 1
  end
end

def display_grand_winner(player_wins, computer_wins)
  if player_wins == MAX_WINS
    filler
    prompt("The match is over. You are the grand winner!")
  elsif computer_wins == MAX_WINS
    filler
    prompt("The match is over. Computer is the grand winner!")
  end
end

def play_again?
  prompt("Do you want to play again? ('y' if yes, 'n' if no)")

  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if %w(y n).include?(answer)
    prompt("Please type in 'y' to play again or 'n' to quit.")
  end

  case answer
  when 'y' then true
  when 'n' then false
  end
end

clear

puts "Welcome to the game!"
filler
puts "The first one to reach #{MAX_WINS} wins is the grand winner."
filler

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt(OPTIONS)

  choice          = player_choice
  computer_choice = VALID_CHOICES.sample

  clear

  prompt("You chose: #{choice}; computer chose: #{computer_choice}")

  result = results(choice, computer_choice)
  prompt(result)

  update_scores(result, player_score, computer_score)

  player_wins   = player_score.length
  computer_wins = computer_score.length

  filler

  prompt("Player's score is #{player_wins}")
  prompt("Computer's score is #{computer_wins}")

  filler

  display_grand_winner(player_wins, computer_wins)

  if player_wins == MAX_WINS || computer_wins == MAX_WINS
    filler
    break unless play_again?

    player_score   = []
    computer_score = []
    clear
  end
end

filler
prompt("Thank you for playing. Good bye!")
