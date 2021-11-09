class Acronym
  class << self
    def abbreviate(words)
      words_list = words.scan(/\b\w/).join.upcase
    end
  end
end