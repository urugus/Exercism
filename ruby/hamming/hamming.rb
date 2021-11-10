class Hamming
  class << self
    def compute(dna1, dna2)
      # binding.irb
      raise ArgumentError if dna1.length != dna2.length
      dna1.chars.each_with_index.inject(0) {|mistakes, (d1, idx)|
        d1 != dna2[idx] ? mistakes += 1 : mistakes
      }
    end
  end
end

puts Hamming.compute('GGACTGAAATCTG', 'AAACTGAAATCTG')