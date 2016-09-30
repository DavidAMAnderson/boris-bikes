require './lib/bike'
require './lib/docking_station'


class Van

  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def unload_working_bike
    fail "No bikes available" if @bikes.count <=0
    @bikes.pop
  end

  def unload_broken_bike
    fail "No bikes available" if @broken_bikes.count <=0
    @broken_bikes.pop
  end

  def load_bike(bike)
    fail 'Van is full' if full?
    if bike.broken
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  private

  attr_reader :bikes, :broken_bikes

  def full?
    (@bikes.count + @broken_bikes.count) >= @capacity
  end

end
