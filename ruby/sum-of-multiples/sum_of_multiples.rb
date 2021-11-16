class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def to(upper)
    return 0 if @nums.sum == 0
    @nums.map{|n| calc_multiples(n, upper-1)}.flatten.uniq.sum
  end


  private

    def calc_multiples(num, upper)
      [*1..(upper / num)].map{|n| n * num}
    end

end
