require_relative 'hashes/prices'

# controls and stores the data
class Repository
  attr_accessor :shopping_cart

  def initialize
    @shopping_cart = []
  end

  def add_to_cart(item_instance)
    @shopping_cart << item_instance
  end

  def all_items
    @shopping_cart
  end

  def delete_item(item_index)
    @shopping_cart.delete_at(item_index)
  end
end
