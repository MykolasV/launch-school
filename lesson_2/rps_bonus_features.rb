VALID_CHOICES = %w(rock paper scissors lizard spock)
OPTIONS = <<-MSG
'r' for rock,
   'p' for paper,
   's' for scissors,
   'l' for lizard,
   'v' for spock
MSG

player_score   = 0
computer_score = 0

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
  input = gets.chomp.downcase
  arr   = %w(r p s l v)

  until arr.include?(input)
    clear
    prompt("That's not a valid choice.")
    prompt("Please choose:")
    prompt(OPTIONS)
    input = gets.chomp.downcase
  end

  VALID_CHOICES[arr.index(input)]
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

def play_again?
  answer = gets.chomp.downcase

  loop do
    if %w(y n).include?(answer)
      return answer
    else
      prompt("Please type in 'y' to play again or 'n' to quit.")
      answer = gets.chomp.downcase
    end
  end
end

clear

puts "Welcome to the game!"
filler
puts "The first one to reach five wins is the grand winner."
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

  if result == "You won!"
    player_score += 1
  elsif result == "Computer won!"
    computer_score += 1
  end

  filler

  prompt("Player's score is #{player_score}")
  prompt("Computer's score is #{computer_score}")

  filler

  if player_score == 5
    filler
    prompt("The match is over. You are the grand winner!")
  elsif computer_score == 5
    filler
    prompt("The match is over. Computer is the grand winner!")
  end

  if player_score == 5 || computer_score == 5
    filler
    prompt("Do you want to play again? ('y' if yes, 'n' if no)")

    answer = play_again?
    break if answer == 'n'

    player_score   = 0
    computer_score = 0
    clear
  end
end

filler
prompt("Thank you for playing. Good bye!")
