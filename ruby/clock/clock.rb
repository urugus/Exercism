=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end


class Clock
  attr_reader :hour, :minute
  
  ONE_DAY_IN_HOURS = 24
  ONE_HOUR_IN_MINUTES = 60

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / ONE_HOUR_IN_MINUTES) % ONE_DAY_IN_HOURS
    @minute = minute % ONE_HOUR_IN_MINUTES
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
    [@hour, @minute].map{|t| t.to_s.rjust(2,'0')}.join(':')
  end

end