require_relative 'bike'

class DockingStation

	attr_reader :bikes

	def initialize
   @bikes = []
	end

	def release_bike
	 fail 'No bikes available' if @bikes.empty?
	 @bikes.pop
	end

	def dock(orange_bike)
		fail 'Docking station full' if @bikes.count >= 20
		@bikes << orange_bike
	end
end
