require_relative 'hashes/prices'
require_relative 'item'

# controller controls the repository and view
class Controller
  def initialize(repository, view)
    @repository = repository
    @view = view
    @shopping_items = PRICES.keys
  end

  def add_item
    index = @view.user_adds_item
    if index < @shopping_items.size
      new_item = @shopping_items[index].to_s
      new_item_instance = Item.new(new_item)
      @repository.add_to_cart(new_item_instance)
    else
      @view.error_message
      add_item
    end
  end

  def shopping_cart_all
    @view.display(@repository.all_items)
  end

  def remove_item
    shopping_cart_all
    remove_index = @view.remove_item
    if remove_index < @repository.shopping_cart.size
      @repository.delete_item(remove_index)
    else
      @view.error_message
      remove_item
    end
  end

  def checkout
    # calc total
    total = @repository.shopping_cart.map do |e|
      e.price
    end
    final_array = @repository.shopping_cart
    @view.present_checkout(final_array, total.sum)
  end
end
