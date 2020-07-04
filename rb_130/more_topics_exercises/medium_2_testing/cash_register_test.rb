require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end
  
  def test_accept_money
    @transaction.amount_paid = 20

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal previous_amount + 20, current_amount
  end
  
  def test_change
    @transaction.amount_paid = 30
    change = @register.change(@transaction)

    assert_equal 10, change
  end
  
  def test_give_receipt
    assert_output("You've paid $20.\n") { @register.give_receipt(@transaction) }
  end
end
