require_relative 'station'

class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end

  def fare
    complete? ? calculate_fare : PENALTY_FARE
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

  private

  def calculate_fare
    return PENALTY_FARE if @exit_station == "N/A"
    entry_s = Station.new @entry_station
    exit_s = Station.new @exit_station
    (entry_s.zone - exit_s.zone).abs + 1
  end

end
