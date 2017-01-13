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
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    !entry_station.nil? && !exit_station.nil?
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end

  def record
    entry_station = "N/A" if entry_station.nil?
    {start: entry_station, end: exit_station}
  end



end
