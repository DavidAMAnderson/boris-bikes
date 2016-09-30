require './lib/bike'

class Garage

  attr_accessor :capacity

  DEFAULT_CAPACITY = 70

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_working_bike
    fail "No bikes available" if @bikes.count <=0
    @bikes.pop
  end

  # def unload_broken_bike
  #   fail "No bikes available" if @broken_bikes.count <=0
  #   @broken_bikes.pop
  # end

  def receive_bike(bike)
    fail 'Garage is full' if full?
    fail "Bike is working" if bike.broken == false
      @broken_bikes << bike
  end

  # def fix_bike
  #   for bike in @broken_bikes.count
  #     bike.broken == false
  #   end
  # end

  def fix_bike
    @broken_bikes.each { |bike|
      bike.broken = false
      @bikes << bike
      @broken_bikes.drop(1)
    }
  end



  private

  attr_reader :bikes, :broken_bikes

  def full?
    (@bikes.count + @broken_bikes.count) >= @capacity
  end

end
