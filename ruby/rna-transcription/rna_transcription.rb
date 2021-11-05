class Complement

  
  class << self
    
    COMPLEMENT_LIST = {G: 'C', C: 'G', T: 'A', A: 'U'}
    
    def of_dna(dna_strand)
        dna_strand.split(//).map{|dna| COMPLEMENT_LIST[dna.to_sym]}.join
    end
  end
end