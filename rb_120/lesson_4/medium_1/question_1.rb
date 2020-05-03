class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# no need to prefix 'balance' with @ sign on line 9 because we're calling the
# getter method there.
