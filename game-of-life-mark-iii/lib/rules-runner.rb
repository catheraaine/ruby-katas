module Rules

  def happy?(cell)
    (cell.neighbors == 2 || cell.neighbors == 3) && (cell.alive?)
  end

  def lonely?(cell)
    (cell.neighbors < 2) && (cell.alive?)
  end

  def crowded?(cell)
    (cell.neighbors > 3) && cell.alive?
  end

  def zombie?(cell)
    (cell.neighbors == 3) && !cell.alive?
  end

end
