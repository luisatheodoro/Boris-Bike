require "docking_station"

describe DockingStation do
 it {expect(DockingStation.new.release_bike)}
 it {expect(DockingStation.new.docking_bike)}

end

describe Bike do
  it {expect(Bike.new.working?)}
end
