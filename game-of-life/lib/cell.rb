class Cell
  attr_reader :state
  attr_accessor :neighbors

  def initialize
    @state = 0
    @neighbors = 0
  end

  def birth
    @state = 1
  end

  def alive?
    @state == 1 || @state == "1"
  end

  def dead?
    @state != 1 || @state != "1"
  end

  def lonely?
    @neighbors < 2
  end

  def crowded?
    @neighbors > 3
  end

  def happy?
    @neighbors == 2 || @neighbors == 3
  end

  def zombie?
    @neighbors == 3
  end

  def current_neighbors(living_cells)
    @neighbors = living_cells
  end

  def neighbors?
    @neighbors
  end

end
