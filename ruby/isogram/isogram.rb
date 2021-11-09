class Isogram
  class << self
    def isogram?(input)
      alphabet_list = input.sub(/\s|-/, '').downcase.chars
      alphabet_list.uniq == alphabet_list
    end
  end
end