class SpaceAge
  
  SECONDS_IN_1YEAR_ON_EARTH = 60 * 60 * 24 * 365.25
  
  SPACE_AGES = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }
  
  
  def initialize(second)
    @year_on_earth = second / SECONDS_IN_1YEAR_ON_EARTH
  end

  SPACE_AGES.each {|key, value|
    define_method "on_#{key}" do
      (@year_on_earth / value).round(2)
    end
  }
  
end