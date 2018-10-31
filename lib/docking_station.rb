require './lib/bike'

class DockingStation
  def initialize
    @bikes = []
  end
  attr_reader :bikes

  def dock_bike(bike)
    raise 'Docking station full' if @bikes.count >= 20
    @bikes << bike
  end

  def release_bike
    raise 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

end



# docking_station = DockingStation.new
# release_bike = docking_station.release_bike
