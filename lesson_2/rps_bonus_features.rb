VALID_CHOICES = %w(rock paper scissors lizard spock)

OPTIONS = <<-MSG
'r' for rock,
   'p' for paper,
   's' for scissors,
   'l' for lizard,
   'v' for spock
MSG

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

def update_scores(result, scores)
  if result == "You won!"
    scores[:player] += 1
  elsif result == "Computer won!"
    scores[:computer] += 1
  end
end

def display_grand_winner(scores)
  if scores[:player] == MAX_WINS
    filler
    prompt("The match is over. You are the grand winner!")
  elsif scores[:computer] == MAX_WINS
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

  answer == 'y'
end

clear

puts "Welcome to the game!"
filler
puts "The first one to reach #{MAX_WINS} wins is the grand winner."
filler

scores = { player: 0, computer: 0 }

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt(OPTIONS)

  choice          = player_choice
  computer_choice = VALID_CHOICES.sample

  clear

  prompt("You chose: #{choice}; computer chose: #{computer_choice}")

  result = results(choice, computer_choice)
  prompt(result)

  update_scores(result, scores)

  filler

  prompt("Player's score is #{scores[:player]}")
  prompt("Computer's score is #{scores[:computer]}")

  filler

  display_grand_winner(scores)

  if scores[:player] == MAX_WINS || scores[:computer] == MAX_WINS
    filler
    break unless play_again?

    scores = { player: 0, computer: 0 }

    clear
  end
end

filler
prompt("Thank you for playing. Good bye!")
