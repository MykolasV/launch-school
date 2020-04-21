SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

CARDS = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
          '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10,
          'King' => 10, 'Ace' => 11 }

def clear
  system('clear') || system('cls')
end

def prompt(msg)
  puts "=> #{msg}"
end

def filler
  puts '-' * 40
end

def start?
  loop do
    prompt("Press 'enter' to start!")
    answer = gets.chomp
    break if answer == ''
  end
end

def initialize_deck
  deck = {}

  SUITS.each do |suit|
    deck[suit] = {}
    CARDS.each do |card, value|
      deck[suit][card] = value
    end
  end

  deck
end

def deal_card!(deck, current_player)
  suit = SUITS.sample
  current_player[suit] = [] if !current_player.key?(suit)
  current_player[suit] << deck[suit].to_a.sample.first
  deck[suit].delete(current_player[suit].last)
end

def card_values_sum(current_player)
  values = current_player.values.flatten.map { |card| CARDS[card] }
  sum = values.sum

  # switch 'Ace' from 11 to 1 when appropriate
  values.count(11).times { sum -= 10 if sum > 21 }

  sum
end

def busted?(current_player)
  card_values_sum(current_player) > 21
end

def joinor(array, delimiter = ', ', word = 'and')
  return array.first.to_s if array.size == 1
  return "#{array.first} #{word} #{array.last}" if array.size == 2

  result = ''
  array.each_with_index do |item, idx|
    result += idx == array.size - 1 ? "#{word} #{item}" : "#{item}#{delimiter}"
  end

  result
end

def card_names(current_player)
  current_player.each_with_object([]) do |(key, value), array|
    array << "#{joinor(value)} of #{key}"
  end
end

def display_cards(player, dealer)
  prompt("You have: #{joinor(player.values.flatten)}.")
  prompt("Dealer has: #{dealer.values.flatten.first} and unkown card.")
end

def retrieve_hit_or_stay
  prompt("Hit or Stay? ('h' to hit, 's' to stay)")

  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if %w(h s).include?(answer)
    prompt("Invalid input. Please type in 'h' to hit or 's' to stay.")
  end

  answer == 'h' ? 'hit' : 'stay'
end

def player_turn!(deck, player, dealer)
  prompt("Your turn...")
  filler

  loop do
    display_cards(player, dealer)
    filler

    hit_or_stay = retrieve_hit_or_stay
    prompt(hit_or_stay)
    break if hit_or_stay == 'stay' || busted?(player)
    deal_card!(deck, player)
    break if busted?(player)
    sleep(3)
    clear
    filler
  end

  sleep(3)
end

def dealer_turn!(deck, dealer)
  prompt("Dealer's turn...")

  loop do
    filler
    prompt("Hit or Stay?")
    sleep(3)

    if card_values_sum(dealer) >= 17
      prompt('stay')
      break
    else
      deal_card!(deck, dealer)
      prompt('hit')
      break if busted?(dealer)
    end
  end

  sleep(3)
end

def determine_winner(player, dealer)
  card_values_sum(player) > card_values_sum(dealer) ? 'Player' : 'Dealer'
end

def display_winner(player, dealer)
  if card_values_sum(player) != card_values_sum(dealer)
    prompt("The winner is #{determine_winner(player, dealer)}!")
  else
    prompt("It's a tie!")
  end
end

def display_final_cards(player, dealer)
  prompt("You have: #{joinor(card_names(player))}.")
  prompt("Dealer has: #{joinor(card_names(dealer))}.")
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
prompt("Welcome to Twenty-One!")
prompt("Try to get as close to 21 as possible, without going over.")
prompt("If you go over 21, it's a 'bust' and you lose.")
filler
start?
clear

loop do
  deck = initialize_deck
  player = {}
  dealer = {}

  prompt("Dealing cards...")
  2.times do
    deal_card!(deck, player)
    deal_card!(deck, dealer)
  end
  sleep(3)

  clear
  player_turn!(deck, player, dealer)

  if busted?(player)
    clear
    prompt("You lost!")
  end

  unless busted?(player)
    clear
    dealer_turn!(deck, dealer)

    if busted?(dealer)
      clear
      prompt("Dealer lost. You won!")
    else
      clear
      display_winner(player, dealer)
      filler
    end
  end

  display_final_cards(player, dealer)

  filler
  break unless play_again?
  clear
end

filler
prompt("Thanks for playing Twenty-One. Good bye!")
filler
