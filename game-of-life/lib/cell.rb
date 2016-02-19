class Cell
  attr_reader :state, :feeling

  def initialize
    @state = 0
    # @feeling = false
  end

  def create(start_state)
    @state = start_state
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


end
