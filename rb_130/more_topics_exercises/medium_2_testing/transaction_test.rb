require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new('20')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal 20, @transaction.amount_paid
  end
end
