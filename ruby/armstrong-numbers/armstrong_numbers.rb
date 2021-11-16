class ArmstrongNumber
  class << self
    def calc(upper_limit_num)
      [*0..upper_limit_num].each_with_object([]){|n, an|
          an << n if is_armstrong_number?(n)
      }
    end

    private
    def is_armstrong_number?(n)
      digits = n.to_s.chars.map(&:to_i)
      n == digits.map{|n| n.to_i ** digits.length}.sum
    end
  end
  

end

ArmstrongNumbers = ArmstrongNumber.calc(10 ** 8)