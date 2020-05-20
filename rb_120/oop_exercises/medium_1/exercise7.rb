class GuessingGame
  def initialize(low, high)
    @range = low..high
    size_of_range = high - low + 1
    @number_of_guesses = Math.log2(size_of_range).to_i + 1
  end

  def play
    answer = rand(@range)
    guess = nil
    @number_of_guesses.downto(1) do |remaining_guesses|
      display_remaining_guesses(remaining_guesses)
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = retrieve_guess
      display_feedback(guess, answer)
      break if guess == answer
    end
    display_result(guess, answer)
  end

  private

  def display_remaining_guesses(number)
    case number
    when 1 then puts "You have 1 guess remaining."
    else        puts "You have #{number} guesses remaining."
    end
  end

  def retrieve_guess
    loop do
      guess = gets.chomp
      return guess.to_i if valid?(guess)
      print "Invalid guess. Enter a number between " \
      "#{@range.first} and #{@range.last}: "
    end
  end

  def valid?(guess)
    @range.include?(guess.to_i) && guess.to_i.to_s == guess
  end

  def display_feedback(guess, answer)
    if guess > answer
      puts "Your guess is too high."
    elsif guess < answer
      puts "Your guess is too low."
    else
      puts "That's the number!"
    end
    puts ''
  end

  def display_result(guess, answer)
    puts guess == answer ? "You won!" : "You have no more guesses. You lost!"
  end
end

game = GuessingGame.new(501, 1500)
game.play
