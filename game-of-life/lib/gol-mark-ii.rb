require_relative "cell"

class Cycle
  attr_accessor :height, :width, :grid
  attr_reader :newGrid

  def initialize(height, width, grid)
    @height = height
    @width = width
    @grid = grid
    @newGrid = []
    @locations = findPlacementOfNeighbors
  end

  def evolve
    makeNewGrid
    countNeighbors
    checkState
    returnEvolvedGrid
  end

  def checkState
    newGrid.each do |cell|
      if cell != "\n"
        if cell.lonely? || cell.crowded?
          cell.die
        elsif cell.zombie?
          cell.birth
        end
      end
    end

  end

  def createLife(cell_string)
    if cell_string == "\n"
      return cell_string
    else
      cell = Cell.new
      if cell_string == "*"
        cell.birth
      end
      return cell
    end
  end

  def makeNewGrid
    grid.each_char do |i|
      newGrid << createLife(i)
    end
  end

  def returnEvolvedGrid
    newGrid.join
  end

  def countNeighbors
    newGrid.each_with_index do |cell, i|
      if cell != "\n"
        translate = []
        neighbors = 0
        @locations.each do |x|
          if (i + x) >= 0
            translate << (i + x)
          end
        end

        translate.each do |y|
          if newGrid[y] && (newGrid[y] != "\n")
            if newGrid[y].alive?
              neighbors += 1
            end
          end
        end

        cell.current_neighbors(neighbors)
      end
    end

  end

  def findPlacementOfNeighbors
    location = []
    location << -(width + 2)
    location << -(width + 1)
    location << -(width)
    location << (- 1)
    location << (1)
    location << (width)
    location << (width + 1)
    location << (width + 2)
    location
  end



end
