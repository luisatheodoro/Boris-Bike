require 'docking_station.rb'
require 'bike'

class Van
  attr_reader :bikes

  def initialize(bikes = [])
    @bikes = bikes
  end

  def load_broken_bikes(docking_station)
    @bikes << docking_station.release_broken_bike_to_van
  end

  def unload_broken_bikes
    @broken_bikes = find_all_broken_bikes
    @bikes.delete_if {|bike| bike.broken? == true}
    @broken_bikes
  end

  private

  def find_all_broken_bikes
    @bikes.find_all {|bike| bike.broken? == true}
  end

end
