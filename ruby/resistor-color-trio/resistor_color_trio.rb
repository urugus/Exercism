class ResistorColorTrio

  COLOR_CODED_BANDS = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  COLORS = COLOR_CODED_BANDS.keys.map(&:to_s)
  
  def initialize(colors)
    @colors = colors
  end
  
  def color_code(colors)
    raise ArgumentError unless colors.all?{|c| COLORS.include?(c)}
    colors[0..1].map(&:to_sym).each.inject([]){|array, sym|
      array << COLOR_CODED_BANDS[sym] }.join.to_i * 10 ** COLOR_CODED_BANDS[colors.last.to_sym]
  end

  def label
    "Resistor value: #{Ohm.to_ohm(color_code(@colors))}"
  end
end


class Ohm
  class << self
    def to_ohm(n)
      n / 10 ** 3 >= 1 ? "#{n / 10 ** 3} kiloohms" : "#{n} ohms"
    end
  end
end