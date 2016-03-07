require_relative 'rules-runner'

class Cell
  include Rules
  attr_reader :livingNeighbors, :alive

  def initialize
    @livingNeighbors = 0
    @alive = false
  end

  def giveLife
    @alive = true
  end

  def giveNeighbors(count)
    @livingNeighbors = count
  end

  def neighbors
    @livingNeighbors
  end

  def alive?
    @alive
  end

end
