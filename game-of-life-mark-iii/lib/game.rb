require_relative 'navigator'
require_relative 'cell'

class Game
  attr_reader :grid, :evolvedCells, :height, :width

  def initialize(grid)
    @grid = grid
    @width = grid[0].count
    @height = grid.count
    @evolvedCells = Array.new(height){Array.new(width)}
  end

  def evolve
    grid
  end

  def callNavigator
    nav = Navigator.new(height, width, grid)
    mappedcells = nav.mapCells
  end

end
