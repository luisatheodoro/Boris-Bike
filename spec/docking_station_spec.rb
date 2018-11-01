require "docking_station"
require "bike"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

  # it 'Releases the docked bike' do
  #   bike = Bike.new
  #   subject.dock_bike(bike)
  #   expect(subject.release_bike).to eq subject.bikes
  # end

  it 'makes sure user can set a bike capacity' do
    subject = DockingStation.new(30)
    expect(subject.capacity).to eq 30
  end

 describe '#release_bike' do
    it 'Raises an error when asked to release bike when bike docking is empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it "Won't release a bike if it is broken" do
      bike = Bike.new
      subject.dock_bike(bike)
      bike.report_broken
      expect { subject.release_bike }.to raise_error 'Bike is broken'
    end
 end

 describe '#dock_bike' do
   it 'returns docked bikes' do
     bike = Bike.new
     subject.dock_bike(bike)
     expect(subject.bikes).to eq [bike]
   end

    it 'raises an error when full' do
      20.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike(Bike.new) }.to raise_error 'Docking station full'
    end

    # it 'accepts a bike broken or not' do
    #   bike = Bike.new
    #   broken_bike = bike.report_broken
    #   expect(subject.dock_bike(broken_bike)).to eq bike
    # end
end
end
