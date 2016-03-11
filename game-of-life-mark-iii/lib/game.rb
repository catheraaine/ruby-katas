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
    callNavigator
    determineNextState(@mappedcells)
    buildNextState(@mappedcells)
    @evolvedCells
  end

  def callNavigator
    nav = Navigator.new(height, width, @grid)
    @mappedcells = nav.newcells
    @mappedcells
  end

  def determineNextState(cells)
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell.lonely? || cell.crowded?
          cell.giveDeath
        elsif cell.zombie?
          cell.giveLife
        end
      end
    end
  end

  def buildNextState(cells)
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell.alive?
          @evolvedCells[x][y] = 1
        else
          @evolvedCells[x][y] = 0
        end
      end
    end
  end

end
