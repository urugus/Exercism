module SavingsAccount
  
  INTEREST_RATE = [
    {balance: -Float::INFINITY...0 , rate: -3.213},
    {balance: 0...1000, rate: 0.5},
    {balance: 1000...5000, rate: 1.621}, 
    {balance: 5000..Float::INFINITY , rate: 2.475}
  ]
  def self.interest_rate(balance)
    INTEREST_RATE.find{|ir| ir[:balance].include?(balance)}[:rate]
  end

  def self.annual_balance_update(balance)
    balance + balance.abs * interest_rate(balance) / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    balance_of_the_year = current_balance
    year = 0
    while balance_of_the_year < desired_balance
      balance_of_the_year = annual_balance_update(balance_of_the_year)
      year += 1
    end
    year
  end
end