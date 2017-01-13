require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :entry_station, :journeys, :journey

  MAX_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
    @journeys = JourneyLog.new
  end

  def top_up(amount)
    raise exceeds_limit_message if exceeds_limit?(amount)
    update_balance(amount)
  end

  def touch_in(station)
    raise insufficient_funds_message if insufficient_funds?
    (!!@journeys.journey.entry_station) ? double_touch_in : @journeys.start(station)
  end

  def touch_out(station)
    @journeys.end(station)
    update_balance(-@journeys.journey.fare)
    @journeys.reset
  end

  private

  def double_touch_in
    @journeys.end("N/A")
    update_balance(-@journeys.journey.fare)
  end

  def update_balance(amount)
    @balance += amount
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
