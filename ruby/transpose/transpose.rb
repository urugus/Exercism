class Transpose
  class << self
    def transpose(input)
      return '' if input == ''
      rows = input.split("\n")
      row_max_size = rows.sort[-1].size
      transposed_rows = rows.map{|a| a.ljust(row_max_size, '0').chars}
      .transpose.map(&:join).map{|t| t.gsub(/0/, '')}.join("\n")
    end
  end
end

input = "The longest line.\nA long line.\nA longer line.\nA line."
p Transpose.transpose(input)