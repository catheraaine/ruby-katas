require 'cell'

class Navigator
  attr_reader :cells, :newcells

  def initialize(height, width, grid)
    @cells = grid
    @width = width
    @height = height
    @newcells = Array.new(height){Array.new(width)}
  end

  def cells
    @cells
  end

  def mapCells
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        # the cell is located at x, y
        # the state of the cell is in 'cell'
        newcell = makeCell(cell)
        @newcells[x][y] = newcell

      end
    end

    populateNeighbors
    return @newcells
  end

  def makeCell(cell)
    newcell = Cell.new
    if cell == 1
      newcell.giveLife
    end

    return newcell

  end

  def populateNeighbors
    @newcells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.giveNeighbors(countNeighbors(x, y))
      end
    end

  end

  def countNeighbors(x, y)
    locations = determineNeighborLocations(x, y)
    count = 0
    locations.each do |neighbor|
      if neighbor.alive?
        count += 1
      end
    end
    return count
  end

  def determineNeighborLocations(x, y)
    locations = []
    oneUp = y - 1
    oneDown = y + 1
    oneLeft = x - 1
    oneRight = x + 1

    if oneUp > 0
      locations << @newcells[oneLeft][oneUp] unless oneLeft < 0
      locations << @newcells[x][oneUp]
      locations << @newcells[oneRight][oneUp] unless oneRight < 0
    end

    locations << @newcells[oneLeft][y] unless oneLeft < 0
    locations << @newcells[oneRight][y] unless nil

    if oneDown > 0
      locations << @newcells[oneLeft][oneDown] unless oneLeft < 0
      locations << @newcells[x][oneDown]
      locations << @newcells[oneRight][oneDown] unless oneRight < 0
    end

    return locations

  end

  def checkNeighborForLife (neighbor)
  end


end
