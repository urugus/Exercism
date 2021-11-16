class ArmstrongNumbers
  class << self
    def include?(number)
      digits = number.digits
      digits.sum{|d| d**digits.length} == number
    end
  end
end