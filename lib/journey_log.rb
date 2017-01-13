require_relative 'journey'

class JourneyLog

  attr_reader :journey, :journeys

  def initialize
    @journey = Journey.new
    @journeys = []
  end

  def start(station)
    @journey.start(station)
  end

  def end(station)
    @journey.end(station)
    record_journey
  end

  def reset
    @journey = Journey.new
  end

  private

  def record_journey
    @journeys << record
  end

  def record
    @journey.entry_station.nil? ? {start: "N/A", end: @journey.exit_station} : {start: @journey.entry_station, end: @journey.exit_station}
  end

end
