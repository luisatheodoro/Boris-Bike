require "docking_station"

describe DockingStation do
 it {expect(DockingStation.new.release_bike)}
end

describe Bike do
  it {expect(Bike.new.working?)}
end
