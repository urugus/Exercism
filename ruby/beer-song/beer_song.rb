class BeerSong
  class << self

    GO_TO_THE_STORE = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

    def sing_item_on_the_wall(item)
      "#{item.count.capitalize} of beer on the wall, #{item.count} of beer."
    end

    def sing_take_down(item)
      "Take #{item.pronoun} down and pass it around, #{item.count} of beer on the wall.\n"
    end

    def recite(quantity, loop_time)
      bottle = Item.new(quantity: quantity, unit: 'bottle')
      bottle_consumption = Item.new(quantity: 1, unit: 'bottle')

      song = loop_time.times.inject('') { |song, c|
        song += "#{sing_item_on_the_wall(bottle)}\n"
        if bottle.quantity == 0
          song += GO_TO_THE_STORE
        else
          bottle = (bottle - bottle_consumption)
          song += sing_take_down(bottle)
        end
      }
    end
  end
end


class Item
  attr_reader :quantity, :unit

  def initialize(quantity: 0, unit: '')
    raise ArgumentError if quantity < 0
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
    raise ArgumentError unless @unit == other.unit
    Item.new(quantity: @quantity - other.quantity, unit: @unit)
  end

end