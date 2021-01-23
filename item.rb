require_relative 'hashes/ids'
require_relative 'hashes/prices'
require 'pry-byebug'

# Instance of each shopping item
class Item
  attr_reader :name, :price, :id

  def initialize(name)
    @name = name.to_sym
    @price = PRICES[@name]
    @id = IDS[@name]
  end
end
