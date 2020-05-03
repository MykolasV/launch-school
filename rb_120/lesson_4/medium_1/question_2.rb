class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# In the code as it is, on line 11, Ruby will assume that a local variable
# 'quantity' is initialized.

# There needs to be either a 'attr_writer' added for 'quantity' and then
# the setter method invoked: 'self.quantity = ', or instance variable
# reassigned directly: '@quantity =' 
