class Grains
  class << self
    def squares(n)
      [*0..(n-1)].map{|num| 2 ** num}
    end
    def square(n)
      raise ArgumentError if n <= 0 || 64 < n
      squares(n)[n-1]
    end
    def total
      squares(64).sum
    end
  end
end
