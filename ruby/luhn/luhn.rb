class Luhn
  class << self
    def valid?(input)
      digits_list = input.split
      return false unless digits_list.all?{|d| d.match?(/^\d+\d+$/)}
      digits_list.map{|d| doubling_every_second_digit(d)}.sum % 10 == 0
    end

    # 偶数番目の数字を２倍（９を超える場合は９を引く）して合計値を返す
    def doubling_every_second_digit(digits_string)
      sum = 0
      puts digits_string
      digits_string.chars.each_with_index do |d, idx| 
        puts idx.even? ? (d.to_i * 2).to_s.chars.map(&:to_i).sum: d.to_i
      end
      puts sum
      sum
    end

  end
end

Luhn.valid?("000 0")