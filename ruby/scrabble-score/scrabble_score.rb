class Scrabble

  SCORE =  [
    {letters: %w[a e i o u l n r s], value: 1},
    {letters: %w[d g], value: 2},
    {letters: %w[b c m p], value: 3},
    {letters: %w[f h v m y], value: 4},
    {letters: %w[k], value: 5},
    {letters: %w[j x], value: 8},
    {letters: %w[q z], value: 10}
  ]

  def initialize(word)
    @alpahbets = word.downcase.chars
  end

  def score
    @alpahbets.each_with_object(0){|a, sum|
      binding.irb
      sum += SCORE.each_with_object(0) {|s, v|
        v += s[:value] if s[:letters].include?(a)
      }
    }
  end

end

p Scrabble.new('fact').score