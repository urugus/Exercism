require 'minitest/autorun'
require_relative 'twelve_days'

class TwelveDaysTest < Minitest::Test
  def test_the_whole_song
    song_file = File.expand_path('song.txt', __dir__)
    expected = IO.read(song_file)
    assert_equal expected, TwelveDays.song
  end
end


class OrdinalMethodTest < Minitest::Test
  def test_ordinal_method
    assert_equal 'first', 1.to_ord
    assert_equal 'fourth', 4.to_ord
  end
end