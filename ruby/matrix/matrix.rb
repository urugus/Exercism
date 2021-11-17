class Matrix
  def initialize(input)
    @input = input
  end
  
  def rows
    @input.split("\n").map(&:split).map{|i| i.map(&:to_i)}
  end
  
  def columns
    rows.transpose
  end
end