class BeerSong
  
  MAX_STOCK = 99
  
  class << self
    
    def recite(quantity, loop_time)
      beer = Item.new(name: 'beer', quantity: quantity, unit: 'bottle')
      beer_consumption = Item.new(name: 'beer', quantity: 1, unit: 'bottle')

      phrases = loop_time.times.inject([]) { |phrases, c|
        phrases << sing_one_phrase(beer, beer = beer - beer_consumption)
      }.join("\n")
    end


    private
    
    def sing_one_phrase(item, item_after_consume)
      phrase = "#{item.count.capitalize} of #{item.name} on the wall, #{item.count} of #{item.name}.\n"
      phrase += if item.quantity == 0
            item_after_adding_stock = Item.new(name: item.name, quantity: MAX_STOCK, unit: item.unit) 
            "Go to the store and buy some more, #{item_after_adding_stock.count} of #{item_after_adding_stock.name} on the wall.\n"
          else
            "Take #{item.pronoun} down and pass it around, #{item_after_consume.count} of #{item_after_consume.name} on the wall.\n"
          end
    end

  end
end


class Item
  attr_reader :name, :quantity, :unit

  def initialize(name: '', quantity: 0, unit: '')
    @name = name
    @quantity = quantity
    @unit = unit
  end

  def count
    case @quantity
    when 0
      "no more #{@unit}s"
    when 1
      "1 #{unit}"
    else
      "#{@quantity} #{unit}s"
    end
  end

  def pronoun 
    @quantity == 1 ? 'it' : 'one'
  end

  def -(other)
    raise ArgumentError unless @unit == other.unit && @name == other.name
    Item.new(name: @name, quantity: @quantity - other.quantity, unit: @unit)
  end

end