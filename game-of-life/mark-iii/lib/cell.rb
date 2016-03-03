

class Cell
  attr_reader :livingNeighbors, :alive

  def initialize
    @livingNeighbors = 0
    @alive = false
  end

  def becomeAlive
    @alive = true
  end

  def neighbors
    @livingNeighbors
  end

end
