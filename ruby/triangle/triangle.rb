class Triangle
  def initialize(edges)
    @edges = edges
  end

  def equilateral?
    is_complited? && @edges.all?(@edges[0])
  end

  def isosceles?
    is_complited? && @edges.sort.combination(2).uniq.size <= 2
  end

  def scalene?
    is_complited? && !equilateral? && !isosceles?
  end

  def is_complited?
    perimeter = @edges.sum
    @edges.all?{|e| 2 * e  < perimeter}
  end
end
