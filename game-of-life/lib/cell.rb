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

  def die
    @state = 0
  end

  def alive?
    @state == 1
  end

  def dead?
    !alive?
  end

  def lonely?
    (@neighbors < 2) && alive?
  end

  def crowded?
    (@neighbors > 3)  && alive?
  end

  def happy?
    (@neighbors == 2 || @neighbors == 3) && alive?
  end

  def zombie?
    (@neighbors == 3) && dead?
  end

  def current_neighbors(living_cells)
    @neighbors = living_cells
  end

  def neighbors
    @neighbors
  end

  def to_s
    if alive?
      "*"
    else
      "."
    end
  end

end
