require_relative "cell"

class Cycle
  attr_accessor :height, :width, :grid
  attr_reader :newGrid

  def initialize(height, width, grid)
    @height = height
    @width = width
    @grid = grid
    @newGrid = []
    @pattern = findPattern
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
        if cell.lonely?
          cell.die
        elsif cell.crowded?
          cell.die
        elsif cell.happy?
          cell
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
      if cell_string == "*"
        cell = Cell.new
        cell.birth
      elsif cell_string == "."
        cell = Cell.new
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
    returnGrid =  newGrid.join
    return returnGrid
  end

  def countNeighbors
    newGrid.each_with_index do |cell, i|
      if cell != "\n"
        translate = []
        neighbors = 0
        @pattern.each do |x|
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

  def findPattern
    pattern = []
    pattern << -(width + 2)
    pattern << -(width + 1)
    pattern << -(width)
    pattern << (- 1)
    pattern << (1)
    pattern << (width)
    pattern << (width + 1)
    pattern << (width + 2)
    return pattern
  end



end
