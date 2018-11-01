class Bike
  attr_reader :broken_bike
  def working?
    @working = true
  end

  def report_broken
    @broken_bike = true
  end

  def broken?
    @broken_bike
  end
end
