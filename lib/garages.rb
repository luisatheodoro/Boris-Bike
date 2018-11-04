class Garages

  def initialize(broken_bikes = [])
    @broken_bikes = broken_bikes
  end

  def receive_broken_bikes(van)
    @broken_bikes << van.unload_broken_bikes
  end

end
