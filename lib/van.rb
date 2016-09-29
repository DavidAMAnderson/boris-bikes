require 'bike'

class Van

attr_reader :working_bikes, :broken_bikes

  def initialize
    @working_bikes = []
    @broken_bikes = []
  end

  def load_bike(bike)
    if bike.broken
      broken_bikes << bike
    else
      working_bikes << bike
    end
  end

  def unload_bike_garage
    fail "error - no bikes available" if broken_bikes.count <= 0
    broken_bikes.pop
  end

  def unload_bike_docking_station
    fail "error - no bikes available" if working_bikes.count <= 0
    working_bikes.pop
  end

# def empty?
#   bikes.count <= 0
# end


end
