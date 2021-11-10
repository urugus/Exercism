class Series

  def initialize(digits_string)
    @digits_string = digits_string
  end

  def slices(len)
    raise ArgumentError if @digits_string.length < len
    (@digits_string.length - len + 1).times.inject([]) do |array, idx|
      array << @digits_string[idx..(idx + len-1)]
    end
  end
end