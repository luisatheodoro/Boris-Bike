class Bike
  attr_reader :broken_bike
  def working?
    if report_broken
      @working = false
    else
      @working = true
    end
  end

  def report_broken
    @broken_bike = true
  end

  def broken?
    @broken_bike
  end
end
