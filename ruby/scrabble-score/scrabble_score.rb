class Scrabble

  SCORE =  [
    {letters: %w[a e i o u l n r s t], value: 1},
    {letters: %w[d g], value: 2},
    {letters: %w[b c m p], value: 3},
    {letters: %w[f h v m y], value: 4},
    {letters: %w[k], value: 5},
    {letters: %w[j x], value: 8},
    {letters: %w[q z], value: 10}
  ]
  
  def initialize(word)
    @alpahbet = word 
  end

  def score
    return 0 if @alpahbet.nil?

    sum = @alpahbet.downcase.chars.inject(0){|subtotal, a| 
       SCORE.each {|sc|
        sc[:letters].include?(a) ? subtotal += sc[:value] : subtotal
      }
    }  
  end

end

Scrabble.new('fact').score