class Card
  attr_reader :rank, :suit

  CARDS_IN_ORDER = [*2..10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def ==(other)
    rank == other.rank && suit == other.suit
  end

  def <=>(other)
    CARDS_IN_ORDER.index(rank) <=> CARDS_IN_ORDER.index(other.rank)
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8


puts '----------'

# Given solution:

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8


puts '----------'

# Further exploration:

class Card
  include Comparable
  attr_reader :rank, :suit

  SUITS_IN_ORDER = ['Diamonds', 'Clubs', 'Hearts', 'Spades']

  CARDS_IN_ORDER = [*2..10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def compare_rank(other)
    CARDS_IN_ORDER.index(rank) <=> CARDS_IN_ORDER.index(other.rank)
  end

  def compare_suit(other)
    SUITS_IN_ORDER.index(suit) <=> SUITS_IN_ORDER.index(other.suit)
  end

  def <=>(other)
    compare_rank(other) == 0 ? compare_suit(other) : compare_rank(other)
  end
end

cards = [Card.new(4, 'Diamonds'), Card.new(4, 'Clubs'),
         Card.new(4, 'Hearts'), Card.new(4, 'Spades')]

puts Card.new(4, 'Spades') > Card.new(4, 'Hearts')
puts Card.new(4, 'Hearts') > Card.new(4, 'Clubs')
puts Card.new(4, 'Clubs') > Card.new(4, 'Diamonds')
puts Card.new(5, 'Diamonds') > Card.new(4, 'Spades')
