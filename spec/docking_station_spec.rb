require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

 describe '#release_bike' do
    it 'Raises an error when asked to release bike when bike docking is empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
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
end
end
