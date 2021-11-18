class Nucleotide
  BASES = %W[A T C G].freeze

  def initialize(dna)
    @dna = dna
  end

  def count(base)
    @dna.count(base)
  end

  def histogram
    BASES.each_with_object({}){|b, h| h[b] = @dna.count(b)}
  end
 
  class << self
    def from_dna(dna)
      regex = Regexp.new("^[#{BASES}]*$")
      raise ArgumentError unless dna.match?(regex)
      Nucleotide.new(dna)
    end
  end
end