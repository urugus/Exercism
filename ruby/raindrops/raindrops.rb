class Raindrops

  FACTORS = {'Pling': 3, 'Plang': 5, 'Plong': 7}

  class << self
    def convert(num)
      ans = FACTORS.each_with_object(''){ |(k, v), t|
        if num % v == 0 
          t << k.to_s
        end
      }

      ans == '' ? num.to_s : ans
    end
  end
end