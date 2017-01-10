class Oystercard

  attr_reader :balance
  attr_accessor :in_journey

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(balance=0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    exceed?(@balance + amount)
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    sufficient_funds?
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false

  end



  private

  def exceed?(balance)
    error_message = "You have exceeded #{MAX_BALANCE}!"
    fail error_message if balance > MAX_BALANCE
  end

  def sufficient_funds?
    error_message = "You do not have enough funds for this journey."
    fail error_message if @balance < MIN_FARE
  end

  def deduct(amount)
    @balance -= amount
  end 

end
