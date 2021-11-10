class Hamming
  class << self
    def compute(dna1, dna2)
      raise ArgumentError if dna1.length != dna2.length
      dna1.chars.zip(dna2.chars).count{|d1, d2| d1 != d2}
    end
  end
end