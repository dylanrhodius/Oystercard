require 'csv'

class Station

  attr_reader :name
  attr_reader :zone

  def initialize(name)
    @name = name
    load_stations
    @zone = define_zone
  end

  def load_stations(filename = 'stations.csv')
    raise "No file to load stations from!" if !File.exists?(filename)
    @catalog = Hash.new
    load_from_file(filename)
  end

  private

  def define_zone
    raise "Station doesn't exist on the map yet." if !@catalog.has_key?(@name)
    @catalog[@name]
  end

  def load_from_file(filename)
    CSV.foreach(filename) do |row|
      name = row[0]
      zone = row[1]
      @catalog.store(name,zone.to_i)
    end
  end

end
