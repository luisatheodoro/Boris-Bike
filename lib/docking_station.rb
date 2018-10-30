require './lib/bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise 'No bikes available' unless @bike
  end

  def docking_bike
  end

end



# docking_station = DockingStation.new
# release_bike = docking_station.release_bike
