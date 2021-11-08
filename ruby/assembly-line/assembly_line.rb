class AssemblyLine
  
  def initialize(speed)
    @production_volume = 221.0
    @success_rate = {'safety': 1.0, 'nomal': 0.9, 'low': 0.8, 'very_low': 0.77}
    @speed = speed
  end

  def production_rate_per_hour
    if @speed <= 4
      success_ratio = :safety
    elsif @speed <= 8
      success_ratio = :nomal
    elsif @speed <= 9
      success_ratio = :low
    else
      success_ratio = :very_low
    end
    (@production_volume * @speed * @success_rate[success_ratio]).round(1)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end

AssemblyLine.new(1).production_rate_per_hour