=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end


class Clock
  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60 
    @minute_only = (hour * 60 + minute) % (60 * 24)
  end


  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def to_s
    "#{@hour.to_s.rjust(2,'0')}:#{@minute.to_s.rjust(2,'0')}"
  end

end