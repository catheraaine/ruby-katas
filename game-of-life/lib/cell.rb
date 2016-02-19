class Cell

  def initialize
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
