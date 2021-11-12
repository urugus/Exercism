class Raindrops

  FACTORS = {'Pling': 3, 'Plang': 5, 'Plong': 7}

  class << self
    def convert(num)
      ans = FACTORS.each_with_object([]){ |(k, v), a|
        if num % v == 0 
          a << k.to_s
        end
      }.join

      ans == '' ? num.to_s : ans
    end
  end
end