class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.sort.each_with_object([]){|w, a|
      a << w if w.downcase.chars.sort == @word.chars.sort && w.downcase != @word
    }
  end
end