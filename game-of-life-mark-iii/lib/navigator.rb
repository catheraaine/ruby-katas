require_relative 'cell'

class Navigator
  attr_reader :cells, :newcells

  def initialize(height, width, grid)
    @cells = grid
    @width = width
    @height = height
    @newcells = Array.new(height){Array.new(width)}
    populateNewCells
    populateNeighbors
  end

  def populateNewCells
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        newcell = makeCell(cell, x, y)
        @newcells[x][y] = newcell
      end
    end
  end

  def populateNeighbors
    @newcells.each do |row|
      row.each do |cell|
        neighbors = countNeighbors(cell)
        cell.giveNeighbors(neighbors)
      end
    end
  end

  def makeCell(cell, x, y)
    newcell = Cell.new(x, y)
    if cell == 1
      newcell.giveLife
    end
    newcell
  end

  def countNeighbors(cell)
    count = 0

    # Northwest
    if cell.x > 0 && cell.y > 0
      count += 1 if @newcells[cell.x - 1][cell.y - 1]
    end

    # North
    if cell.y > 0
      count += 1 if @newcells[cell.x][cell.y - 1].alive?
    end

    # Northeast
    if cell.x < (@height - 1) && cell.y > 0
      count += 1 if @newcells[cell.x + 1][cell.y - 1].alive?
    end

    # West
    if cell.x > 0
      count += 1 if @newcells[cell.x - 1][cell.y].alive?
    end

    # East
    if cell.x < (@height - 1)
      count += 1 if @newcells[cell.x + 1][cell.y].alive?
    end

    # Southwest
    if cell.x > 0 && cell.y < (@width - 1)
      count += 1 if @newcells[cell.x - 1][cell.y + 1].alive?
    end

    # South
    if cell.y < (@width - 1)
      count += 1 if @newcells[cell.x][cell.y + 1].alive?
    end

    # Southeast
    if cell.x < (@height - 1) && cell.y < (@width - 1)
      count += 1 if @newcells[cell.x + 1][cell.y + 1].alive?
    end

    count
  end


  def checkNeighborForLife?(neighbor)
    neighbor.alive?
  end


end
