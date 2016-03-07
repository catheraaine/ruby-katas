
class Navigator
  attr_reader :cells

  def initialize(grid)
    @cells = grid
  end

  def cells
    @cells
  end

  def countNeighbors
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        puts "#{x}, #{y}"
        puts "The cell value is #{cell}." 
      end
    end
  end

  # take the grid
  # tell it the number of live neighbors for each location

end
