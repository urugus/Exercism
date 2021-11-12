class Phrase
  def initialize(sentence)
    @sentence = sentence
    @words = sentence.scan(/[A-Za-z]+'*[A-Za-z]+|[0-9]/).map(&:downcase)
  end

  def word_count
    @words.each_with_object({}){|w, wc| wc[w] = @words.count(w)}
  end
end