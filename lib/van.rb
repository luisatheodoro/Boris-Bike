# require 'docking_station.rb'

class Van
  attr_reader :bikes_in_van

  def initialize(bikes_in_van = [])
    @bikes_in_van = bikes_in_van
  end

  def store_broken_bikes(broken_bike)
    @bikes_in_van << broken_bike
  end

end
