require './lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock_bike(bike)
      fail 'Docking station full' if full?
      @bikes << bike
  end

  def release_bike
    raise 'No bikes available' if empty?
    raise 'Bike is broken' if :broken?
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end



# docking_station = DockingStation.new
# release_bike = docking_station.release_bike
