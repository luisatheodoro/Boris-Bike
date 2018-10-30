class DockingStation
  attr_reader :bike

  def release_bike
    @bike = Bike.new
  end

  def docking_bike
    @bike
  end

end

class Bike
  def working?
  end
end


# docking_station = DockingStation.new
# release_bike = docking_station.release_bike
