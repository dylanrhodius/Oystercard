class Oystercard

  attr_reader :balance
  attr_accessor :in_journey

  MAX_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    exceed?(@balance + amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end



  private

  def exceed?(balance)
    error_message = "You have exceeded #{MAX_BALANCE}!"
    fail error_message if balance > MAX_BALANCE
  end


end
