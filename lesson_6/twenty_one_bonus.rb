GAME = "Thirty-One"

MAX_NUMBER = 31

MAX_DEALER_HIT = 27

MAX_POINTS = 5

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

def introduction
  clear
  prompt("Welcome to #{GAME}!")
  prompt("Try to get as close to #{MAX_NUMBER} as possible, " \
    "without going over.")
  prompt("If you go over #{MAX_NUMBER}, it's a 'bust' and you lose.")
  filler
  prompt("The first to reach #{MAX_POINTS} points will be the grand winner!")
  filler
  prompt("Press 'enter' to start!")
  gets
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

def deal_card!(deck, current_player_cards)
  suit = SUITS.sample
  current_player_cards[suit] = [] if !current_player_cards.key?(suit)
  current_player_cards[suit] << deck[suit].to_a.sample.first
  deck[suit].delete(current_player_cards[suit].last)
end

def card_values_sum(current_player_cards)
  values = current_player_cards.values.flatten.map { |card| CARDS[card] }
  sum = values.sum

  # switch 'Ace' from 11 to 1 when appropriate
  values.count(11).times { sum -= 10 if sum > MAX_NUMBER }

  sum
end

def busted?(current_player_total)
  current_player_total > MAX_NUMBER
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

def card_names(current_player_cards)
  current_player_cards.each_with_object([]) do |(key, value), array|
    array << "#{joinor(value)} of #{key}"
  end
end

def display_cards(player_cards, player_total, dealer_cards)
  prompt("You have: #{joinor(card_names(player_cards))}." \
  " Total of #{player_total}.")
  prompt("Dealer has: #{dealer_cards.values.flatten.first}" \
  " of #{dealer_cards.keys.first} and unkown card.")
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

def player_turn!(deck, player_cards, dealer_cards, player_total)
  loop do
    display_cards(player_cards, player_total, dealer_cards)
    filler

    hit_or_stay = retrieve_hit_or_stay
    prompt("You chose to #{hit_or_stay}!")
    break if hit_or_stay == 'stay' || busted?(player_total)
    deal_card!(deck, player_cards)
    player_total = card_values_sum(player_cards)
    break if busted?(player_total)
    sleep(3)
    clear
    filler
  end

  sleep(3)
end

def dealer_turn!(deck, dealer_cards, dealer_total)
  loop do
    filler
    prompt("Hit or Stay?")
    sleep(3)

    if dealer_total >= MAX_DEALER_HIT
      prompt('Dealer chose to stay!')
      break
    else
      deal_card!(deck, dealer_cards)
      prompt('Dealer chose to hit!')
      dealer_total = card_values_sum(dealer_cards)
      break if busted?(dealer_total)
    end
  end

  sleep(3)
end

def determine_winner(player_total, dealer_total)
  player_total > dealer_total ? 'You win!' : 'Dealer wins!'
end

def display_winner(player_total, dealer_total)
  if player_total != dealer_total
    prompt(determine_winner(player_total, dealer_total))
  else
    prompt("It's a tie!")
  end
end

def display_final_cards(player_cards, player_total, dealer_cards, dealer_total)
  prompt("You have: #{joinor(card_names(player_cards))}.")
  prompt("Total of #{player_total}.")
  prompt("Dealer has: #{joinor(card_names(dealer_cards))}.")
  prompt("Total of #{dealer_total}.")
end

def update_score!(score, player_total, dealer_total)
  if busted?(player_total)
    score[:dealer] += 1
  elsif busted?(dealer_total)
    score[:player] += 1
  elsif dealer_total > player_total
    score[:dealer] += 1
  elsif player_total > dealer_total
    score[:player] += 1
  end
end

def format_score(score)
  score == 1 ? "#{score} point." : "#{score} points."
end

def display_score(score)
  prompt("You have " + format_score(score[:player]))
  prompt("Dealer has " + format_score(score[:dealer]))
end

def display_grand_winner(score)
  if score[:player] > score[:dealer]
    prompt("You are the grand winner!")
  else
    prompt("The Dealer is the grand winnner!")
  end
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

introduction
score = { player: 0, dealer: 0 }

loop do
  clear
  deck = initialize_deck
  player_cards = {}
  dealer_cards = {}

  prompt("Dealing cards...")

  2.times do
    deal_card!(deck, player_cards)
    deal_card!(deck, dealer_cards)
  end

  player_total = card_values_sum(player_cards)
  dealer_total = card_values_sum(dealer_cards)
  sleep(3)

  clear
  prompt("Your turn...")
  filler
  player_turn!(deck, player_cards, dealer_cards, player_total)
  player_total = card_values_sum(player_cards)

  if busted?(player_total)
    clear
    prompt("You busted! Dealer wins!")
  else
    clear
    prompt("Dealer's turn...")
    dealer_turn!(deck, dealer_cards, dealer_total)
    dealer_total = card_values_sum(dealer_cards)

    if busted?(dealer_total)
      clear
      prompt("Dealer busted! You win!")
    else
      clear
      display_winner(player_total, dealer_total)
    end
  end

  filler
  display_final_cards(player_cards, player_total, dealer_cards, dealer_total)
  filler
  update_score!(score, player_total, dealer_total)
  display_score(score)
  sleep(9)

  next unless score[:player] == MAX_POINTS || score[:dealer] == MAX_POINTS
  filler
  display_grand_winner(score)
  filler
  break unless play_again?
  score = { player: 0, dealer: 0 }
end

filler
prompt("Thanks for playing #{GAME}. Good bye!")
filler
