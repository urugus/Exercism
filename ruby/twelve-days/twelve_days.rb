class Integer
  ORDINAL = {
    1 => 'first',
    2 => 'second',
    3 => 'third',
    4 => 'fourth',
    5 => 'fifth',
    6 => 'sixth',
    7 => 'seventh',
    8 => 'eighth',
    9 => 'ninth',
    10 => 'tenth',
    11 => 'eleventh',
    12 => 'twelfth'
  }.freeze

  ENGLISH = {
    1 => 'a',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
  }

  def to_ord
      ORDINAL[self] || ''
  end

  def to_eng
    ENGLISH[self] || ''
  end
end


class TwelveDays
  VERSE = 12
  CHARACTERS = {
    1 => 'Partridge in a Pear Tree',
    2 => 'Turtle Doves',
    3 => 'French Hens',
    4 => 'Calling Birds',
    5 => 'Gold Rings',
    6 => 'Geese-a-Laying',
    7 => 'Swans-a-Swimming',
    8 => 'Maids-a-Milking',
    9 => 'Ladies Dancing',
    10 => 'Lords-a-Leaping',
    11 => 'Pipers Piping',
    12 => 'Drummers Drumming'
  }


  class << self
    def song
      [*1..VERSE].map{|n|
        "On the #{n.to_ord} day of Christmas my true love gave to me: #{phrase_of_characters(n)}.\n"
      }.join("\n")
    end

    def phrase_of_characters(num)
      phrase = num.downto(1).map{|n|
        "#{n.to_eng} #{CHARACTERS[n]}"
      }
      phrase[-1] = 'and ' + phrase[-1] if phrase.size > 1
      phrase.join(', ')
    end
  end
end