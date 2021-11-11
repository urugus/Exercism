class FlattenArray
  class << self
    def flatten(array)
      array.flatten.select{|v| !v.nil? }
    end
  end
end