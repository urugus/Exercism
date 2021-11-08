# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  attr_reader :age, :member
  
  TICKET_PRICE_TABLE = [{age: 1..59, price: 15}, {age: 60.., price: 10}]
  LIMIT_LINE_AGE = 18

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    TICKET_PRICE_TABLE.find{|tpt| tpt[:age].include?(@age)}[:price] || 0
  end

  def watch_scary_movie?
    @age >= LIMIT_LINE_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    if @member
      "🍿"
    else
      raise NotMovieClubMemberError
    end
  end

end
