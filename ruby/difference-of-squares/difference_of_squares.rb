class Squares
  def initialize(num)
    @num = num
    @nums =  [*1..@num]
  end

  def square_of_sum
    @nums.sum ** 2
  end

  def sum_of_squares
    @nums.map{|n| n ** 2}.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end