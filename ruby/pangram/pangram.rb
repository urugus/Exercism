class Pangram
  class << self
    ALPHABET_WORDS_COUNT = 26
    def pangram?(sentence)
      sentence.gsub(/[^a-zA-Z]+/,'').downcase.chars.uniq.length == ALPHABET_WORDS_COUNT
    end
  end
end