
# A cell with value of 1 is considered alive, or true.
# A cell with a value of 0 is considered dead, or false.
# A cell's neighbors inculde the eight surrounding values - all four sides and diagonals.

class Cycle
  attr_reader :cells

  def initialize

  end

  def create_life(cell_state)
    @cells = cell_state
  end

  # def evolve
  #
  #   if (cell == 1) && neighbors
  #     cell = false
  #   end
  #
  #   return cells
  # end



end
