class ResistorColorDuo
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

  class << self
    def value(colors)
      colors[0..1].map(&:to_sym).each.inject([]){|array, sym| array << COLOR_CODED_BANDS[sym] }.join.to_i
    end
  end
end