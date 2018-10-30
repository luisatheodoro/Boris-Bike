require "docking_station"

describe DockingStation do
 it {expect(:release_bike)}
 it {expect(:docking_bike)}

 describe 'release_bike' do
    it 'Raises an error when asked to release bike when bike docking is empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
 end
end
