class Transpose
  class << self
    def transpose(input)
      return '' if input == ''
      rows = input.gsub(' ', '#').split("\n")
      row_max_size = rows.map(&:length).max
      transposed_rows = rows.map{|a| a.ljust(row_max_size, ' ').chars}
      .transpose.map(&:join).map{|t| t.gsub(/\s/, ' ').rstrip.gsub('#', ' ')}
      .join("\n")
    end
  end
end