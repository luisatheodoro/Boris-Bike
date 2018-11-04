require 'van'
require 'docking_station'
require 'bike'

describe Van do
  it 'Van should release broken bikes' do
    #given
    docking_station = DockingStation.new
    docking_station.dock_bike(double(:bike, broken?: true))
    docking_station.dock_bike(double(:bike, broken?: true))
    docking_station.dock_bike(double(:bike, broken?: false))
    docking_station.release_broken_bike_to_van

    #when
    subject.unload_broken_bikes

    #then
    expect(subject.bikes.count).to eq 0
  end

end
