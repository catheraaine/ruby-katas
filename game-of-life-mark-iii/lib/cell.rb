require_relative 'rules-runner'

class Cell
  include Rules
  attr_reader :livingNeighbors, :alive, :x, :y

  def initialize(x, y)
    @livingNeighbors = 0
    @alive = false
    @x = x
    @y = y
  end

  def giveLife
    @alive = true
  end

  def giveDeath
    @alive = false
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

  def dead?
    !alive?
  end


end
