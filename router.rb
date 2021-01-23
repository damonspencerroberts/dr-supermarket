require_relative 'hashes/prices'

# router class to control the overall game
class Router
  def initialize(controller)
    @controller = controller
    @running = true
    @items = PRICES.keys
  end

  def run_shopping
    welcome
    while @running
      shopping_options
      print '> '
      user_choice = gets.chomp.to_i
      option_choice(user_choice)
    end
  end

  def shopping_options
    puts 'What would you like to do?'
    puts '1. Add item to shopping cart'
    puts '2. See my shopping cart'
    puts '3. Remove item from shopping cart'
    puts '4. Checkout and pay'
    puts '5. Exit and leave the store'
    puts "\n\n"
  end

  def option_choice(user_input)
    case user_input
    when 1 then @controller.add_item
    when 2 then @controller.shopping_cart_all
    when 3 then @controller.remove_item
    when 4
      @controller.checkout
      finish
    else
      finish
    end
  end

  def finish
    puts 'Thanks for visiting!'
    end_run!
  end

  def end_run!
    @running = false
  end

  def welcome
    puts "\n"
    puts '-------------------------'
    puts 'Welcome to DR Supermarket'
    puts '-------------------------'
    puts "\n\n"
  end
end
