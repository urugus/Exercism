class Luhn
  class << self
    def valid?(input)
      return false unless input.match?(/^\d[\d\s]+$/)
      digits = input.gsub(' ', '').chars.map(&:to_i).reverse
      sum = digits.each_with_index.inject(0) do |result, (d, idx)| 
        result += idx.odd? ? (d * 2).to_s.chars.map(&:to_i).sum : d
      end
      sum % 10 == 0
    end

  end
end
