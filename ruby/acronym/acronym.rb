class Acronym
  class << self
    def abbreviate(words)
      words_list = words.scan(/[A-z]+|[A-z]+-/)
      words_list.map{|w| w[0]}.join().upcase
    end
  end
end