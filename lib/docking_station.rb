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
    raise 'Bike is broken' if !find_working_bike
    @bikes.delete(find_working_bike)
  end

  def release_broken_bike_to_van
    @bikes.delete(find_broken_bike)
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def find_working_bike
    @bikes.detect {|bike| bike.working? == true}
  end

  def find_broken_bike
    @bikes.detect {|bike| bike.broken? == true}
  end

end



# docking_station = DockingStation.new
# release_bike = docking_station.release_bike
