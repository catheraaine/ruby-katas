require_relative 'navigator'
require_relative 'cell'

class Game

  def initialize(height, width, grid)
    nav = Navigator.new(height, width, grid)
  end

  def evolve
    mappedcells = nav.mapCells
    

  end

end
