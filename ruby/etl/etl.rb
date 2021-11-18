class ETL
  class << self
    def transform(old)
      old.each_with_object({}){|(key, values), n_hash|
        values.map(&:downcase).each {|v| n_hash[v] = key}
      }
    end
  end
end