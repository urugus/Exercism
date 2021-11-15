class ResistorColor

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

  class << self
    def color_code(color)
      COLOR_CODED_BANDS[color.to_sym]
    end
  end
end