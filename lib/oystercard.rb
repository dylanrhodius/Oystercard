class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(balance=0)
    @entry_station = nil
    @exit_station = nil
    @balance = balance
    @journey_history = []
  end

  def top_up(amount)
    exceed?(@balance + amount)
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    sufficient_funds?
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey_history << {entry: @entry_station, exit: station}
    @entry_station = nil
    @exit_station = nil
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
