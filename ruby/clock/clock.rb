=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end


class Clock
  attr_accessor :minute_only

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
    @minute_only = (hour * 60 + minute) % (60 * 24)
  end


  def ==(other)
    @minute_only == other.minute_only
  end

  def +(other)
    Clock.new(minute: @minute_only + other.minute_only)
  end

  def -(other)
    Clock.new(minute: @minute_only - other.minute_only)
  end

  def to_s
    h = ((@hour + @minute / 60) % 24).abs
    m = ((60 + @minute % 60) % 60 ).abs
    "#{h.to_s.rjust(2,'0')}:#{m.to_s.rjust(2,'0')}"
  end

end

  # binding.irb

  # clock = Clock.new(hour: 6, minute: 41)