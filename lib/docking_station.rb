require './lib/bike'

class DockingStation
  attr_reader :bike
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_array = []
    @broken_array = []
    @capacity = capacity
  end

  def release_bike
    fail "error - no bikes available" if working_array.count <= 0
    working_array.pop
  end

  def release_broken_bike
    fail "error - no bikes available" if broken_array.count <= 0
    broken_array.pop
  end

  def dock(bike)
    fail "error - docking station has exceeded capacity" if full?
    if bike.broken
      broken_array << bike
    else
      working_array << bike
    end
  end

private

attr_reader :working_array, :broken_array

def full?
  (working_array.count + broken_array.count) >= capacity
end

# def empty?
#   working_array.count <= 0
# end

end
