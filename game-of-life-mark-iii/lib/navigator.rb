
class Navigator
  attr_reader :cells

  def initialize(height, width, grid)
    @cells = grid
    @width = width
    @height = height
    @newcells = Array.new(height){Array.new(width)}
  end

  def cells
    @cells
  end

  def makeCells
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        newcell = Cell.new
        if cell == 1
          newcell.giveLife
        end
        newcells[y][x] = newcell
      end
    end
  end

  # def countNeighbors
  #   newcells.each_with_index do |row, y|
  #     row.each_with_index do |cell, x|
  #       if cell.alive?
  #
  #       end
  #     end
  # end


  # take the grid
  # tell it the number of live neighbors for each location

end
