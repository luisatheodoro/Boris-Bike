require "docking_station"
require "bike"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

  it 'makes sure user can set a bike capacity' do
    subject = DockingStation.new(30)
    expect(subject.capacity).to eq 30
  end

   describe '#release_bike' do
      it 'Raises an error when asked to release bike when bike docking is empty' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

    it "Won't release a bike if it is broken" do
      bike = double(:bike, working?: false)
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error 'Bike is broken'
    end

    it 'Releases a working bike' do
      subject.dock_bike(double(:bike, working?: true))
      bike = subject.release_bike
      expect(bike).to be_working
    end

  end

   describe '#dock_bike' do
     it 'returns docked bikes' do
       bike = double(:bike)
       subject.dock_bike(bike)
       expect(subject.bikes).to eq [bike]
     end

    it 'raises an error when full' do
      20.times { subject.dock_bike double(:bike) }
      expect { subject.dock_bike(double(:bike)) }.to raise_error 'Docking station full'
    end

    # it 'Van should collect all broken bikes from docking station' do
    #   van = double(:van)
    #   station = DockingStation.new
    #   broken_bike_1 = station.dock_bike(double(:bike, broken?: true))
    #   # broken_bikes_2 = station.dock_bike(double(:bike, broken?: true))
    #   expect(van.bikes_in_van).to include(broken_bikes)
    # end
 end
end
