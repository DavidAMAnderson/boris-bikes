class Bike

attr_accessor :broken

  def initialize
    @broken = false
  end

  def is_broken
   @broken = true
  end
end
