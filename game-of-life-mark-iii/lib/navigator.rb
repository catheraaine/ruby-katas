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
        newcells[x][y] = newcell

      end
    end

    populateNeighbors
    return @newcells
  end

  def populateNeighbors
    newcells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.giveNeighbors(countNeighbors(x, y))
      end
    end

  end

  def countNeighbors (x, y)
    count = 0
    if y - 1 < 0
      oneUp = nil
    else
      oneUp = y - 1
    end

    if y + 1 < 0
      oneDown = nil
    else
      oneDown = y + 1
    end

    if x - 1 < 0
      oneLeft = nil
    else
      oneLeft = x - 1
    end

    if x + 1 < 0
      oneRight = nil
    else
      oneRight = x + 1
    end

    if oneUp
      count += 1 if oneLeft && newcells[oneLeft][oneUp].alive?
      count += 1 if newcells[x][oneUp].alive?
      count += 1 if oneRight && newcells[oneRight][oneUp].alive?
    end

    count += 1 if oneLeft && newcells[oneLeft][y].alive?
    count += 1 if oneRight && newcells[oneRight][y].alive?

    if oneDown
      count += 1 if oneLeft && newcells[oneLeft][oneDown].alive?
      count += 1 if newcells[x][oneDown].alive?
      count += 1 if oneRight && newcells[oneRight][oneDown].alive?
    end

    return count

  end


  def makeCell(cell)
    newcell = Cell.new
    if cell == 1
      newcell.giveLife
    end
    return newcell

  end

end
