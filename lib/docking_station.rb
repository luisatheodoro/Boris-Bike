require './lib/bike'
require './lib/van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock_bike(bike)
      fail 'Docking station full' if full?
      @bikes << bike
  end

  def release_bike
    raise 'No bikes available' if empty?
    raise 'Bike is broken' if !find_working_bike
    @bikes.delete(find_working_bike)
  end

  def release_broken_bike_to_van
    @broken_bikes = find_all_broken_bikes
    @bikes.delete_if {|bike| bike.broken? == true}
    @broken_bikes
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def find_working_bike
    @bikes.detect {|bike| bike.working? == true}
  end

  def find_broken_bike
    @bikes.detect {|bike| bike.broken? == true}
  end

  def find_all_broken_bikes
    @bikes.find_all {|bike| bike.broken? == true}
  end

end
