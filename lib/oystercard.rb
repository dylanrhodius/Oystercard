class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    exceed?(@balance + amount)
    @balance += amount
  end



  private

  def exceed?(balance)
    error_message = "You have exceeded #{MAX_BALANCE}!"
    fail error_message if balance > MAX_BALANCE
  end


end
