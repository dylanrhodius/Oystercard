require_relative 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :journeys, :journey

  MAX_BALANCE = 90

  def initialize(balance=0)
    @journey = Journey.new
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    raise exceeds_limit_message if exceeds_limit?(amount)
    update_balance(amount)
  end

  def touch_in(station)
    raise insufficient_funds_message if insufficient_funds?
    penalty_journey if journey.entry_station
    journey.start(station)
  end

  def touch_out(station)
    journey.end(station)
    finalise_journey
  end

  private

  def penalty_journey
    update_balance(-journey.fare)
    journey.end("N/A")
    record_journey
  end

  def finalise_journey
    update_balance(-journey.fare)
    record_journey
  end

  def update_balance(amount)
    @balance += amount
  end

  def record_journey
    @journeys << journey.record
    journey.reset
  end

  def insufficient_funds_message
    "You do not have enough funds for this journey."
  end

  def exceeds_limit_message
    "You have exceeded #{MAX_BALANCE}!"
  end

  def exceeds_limit?(amount)
    balance + amount > MAX_BALANCE
  end

  def insufficient_funds?
    @balance < Journey::MIN_FARE
  end

end
