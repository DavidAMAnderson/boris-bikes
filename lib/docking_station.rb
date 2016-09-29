require './lib/bike'


class DockingStation

  attr_reader :bike
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_working_bike
    @bikes.pop
  end

  def release_bike
    fail "No bikes available" if empty?
    fail "This bike is broken" if @broken_bikes[0].broken
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.broken
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  private

  attr_reader :bikes, :broken_bikes

  def full?
    @bikes.count >= @capacity
  end

  def empty?
      (@bikes.count + @broken_bikes.count) <= 0
  end


end
