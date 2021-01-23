require_relative 'hashes/prices'

# controls all the views that the user sees
class View
  def print_item_options
    puts 'Available Items'
    puts '------------------------'
    PRICES.keys.each_with_index do |e, i|
      puts "#{i + 1}. #{e}"
    end
    puts '------------------------'
  end

  def user_adds_item
    print_item_options
    puts 'What would you like to add to your cart? [Enter Item Number]'
    print '> '
    gets.chomp.to_i - 1
  end

  def display(array_of_instances)
    puts '------------------------'
    puts 'Shopping Cart:'
    array_of_instances.each_with_index do |e, i|
      puts "#{i + 1}. #{e.name}"
    end
    puts '------------------------'
  end

  def remove_item
    puts 'What would you like to delete from your cart? [Enter Item Number]'
    print '> '
    gets.chomp.to_i - 1
  end

  def present_checkout(final_array, total)
    puts '------------------------'
    puts 'Final Receipt Summary'
    final_array.each_with_index do |e, i|
      puts "#{i + 1}. #{e.id} - #{e.name}: £#{e.price}"
    end
    puts '------------------------'
    puts "Total: £#{total.round(2)}"
  end

  def error_message
    puts '------------------------'
    puts 'ERROR: Please enter an item in the list'
    puts '------------------------'
  end
end
