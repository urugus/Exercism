class Gigasecond
  class << self
    def from(utc_time)
      Time.at(utc_time.to_f + 10**9)
    end
  end
end