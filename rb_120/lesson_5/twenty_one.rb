module Prompt
  def prompt(message)
    puts ">> #{message}"
  end

  def filler
    puts '=' * 40
  end
end

module Hand
  MAX_TOTAL = 21

  def reset
    @cards = []
  end

  def <<(card)
    @cards << card
  end

  def show_cards
    @cards.each { |card| prompt(card) }
  end

  def busted?
    total > MAX_TOTAL
  end

  def total
    total = 0
    sorted_cards = @cards.sort_by(&:value)
    sorted_cards.each do |card|
      total += if card.face == 'Ace' && (total + card.value) > MAX_TOTAL
                 1
               else
                 card.value
               end
    end
    total
  end

  def ==(other)
    total == other.total
  end

  def >(other)
    total > other.total
  end

  def display_busted_or_stay
    if busted?
      prompt("#{name} busted!")
    else
      prompt("#{name} stays...")
    end
  end
end

class Participant
  include Prompt

  include Hand

  def initialize
    reset
  end
end

class Player < Participant
  attr_reader :name

  def hit?
    prompt("Hit or stay? (h/s)")

    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if ['h', 's'].include?(choice)
      prompt('Invalid input. Please type in "h" to hit, or "s" to stay.')
    end
    choice == 'h'
  end

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

  private

  attr_writer :name
end

class Dealer < Participant
  HIT_LIMIT = 17

  def show_one_card
    cards = [@cards[0]] + @cards[1..-1].map { |_| 'Hidden Card' }
    cards.each { |card| prompt(card) }
  end

  def hit?
    total < HIT_LIMIT
  end

  def name
    'Dealer'
  end
end

class Deck
  attr_reader :cards

  def initialize
    reset
  end

  def reset
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.keys.each do |face|
        @cards << Card.new(face, suit)
      end
    end
    mix!
  end

  def mix!
    cards.shuffle!
  end

  def deal(current_player)
    current_player << cards.pop
  end
end

class Card
  attr_reader :face, :suit, :value

  SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

  VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
             '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10,
             'Queen' => 10, 'King' => 10, 'Ace' => 11 }

  def initialize(face, suit)
    @face = face
    @suit = suit
    @value = VALUES[face]
  end

  def to_s
    "#{face} of #{suit}"
  end
end

class Game
  include Prompt

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    introduction
    loop do
      set_up
      player_turn
      dealer_turn
      show_result
      break unless play_again?
      reset
    end
    goodbye_message
  end

  private

  attr_reader :deck, :player, :dealer

  def clear
    system('clear') || system('cls')
  end

  def welcome_message
    clear
    prompt("Welcome to Twenty-One!")
    filler
  end

  def set_player_name
    player.assign_name
  end

  def greet_and_rules
    clear
    prompt("Hello #{player.name}!")
    filler
    prompt("Try to get as close to 21 as possible,")
    prompt("without going over. If you go over 21,")
    prompt("it's a 'bust' and you lose.")
    filler
    prompt("Press 'enter' to start!")
    gets.chomp
    clear
  end

  def introduction
    welcome_message
    set_player_name
    greet_and_rules
  end

  def deal_cards
    prompt("Dealing cards...")
    sleep(4)
    2.times { deck.deal(player) }
    2.times { deck.deal(dealer) }
    clear
  end

  def set_up
    deal_cards
    display_cards
  end

  def display_cards
    clear
    filler
    prompt("You have: ")
    player.show_cards
    prompt("total of #{player.total}")
    filler
    prompt("Dealer has: ")
    dealer.show_one_card
    filler
  end

  def player_turn
    prompt("It's your turn!")

    while player.hit?
      deck.deal(player)
      prompt("#{player.name} hits!")
      sleep(4)
      display_cards
      break if player.busted?
    end

    player.display_busted_or_stay
    sleep(4)
  end

  # rubocop: disable Metrics/MethodLength
  def dealer_turn
    return if player.busted?
    display_cards
    prompt("Dealer's turn!")
    filler
    sleep(4)

    while dealer.hit?
      deck.deal(dealer)
      prompt("Dealer hits!")
      sleep(4)
      display_cards
    end

    dealer.display_busted_or_stay
    sleep(4)
  end
  # rubocop: enable Metrics/MethodLength

  def display_final_cards
    prompt("You have: ")
    player.show_cards
    prompt("total of #{player.total}")
    filler
    prompt("Dealer has: ")
    dealer.show_cards
    prompt("total of #{dealer.total}")
  end

  def determine_winner
    if player == dealer
      nil
    elsif player.busted? || (dealer > player && !dealer.busted?)
      dealer
    else
      player
    end
  end

  def display_winner
    case determine_winner
    when player then prompt("#{player.name} wins!")
    when dealer then prompt("Dealer wins!")
    else             prompt("It's a tie!")
    end
  end

  def show_result
    clear
    display_final_cards
    filler
    display_winner
  end

  def play_again?
    filler
    prompt("Would you like to play again? (y/n)")

    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      prompt('Invalid input. Please type in "y" or "n".')
    end

    answer == 'y'
  end

  def reset
    deck.reset
    player.reset
    dealer.reset
    clear
  end

  def goodbye_message
    prompt('Thanks for playing "Twenty-One"!')
    prompt('Good bye!')
  end
end

twenty_one = Game.new
twenty_one.start
