module Rules

  def happy?
    (self.neighbors == 2 || self.neighbors == 3) && (self.alive?)
  end

  def lonely?
    (self.neighbors < 2) && (self.alive?)
  end

  def crowded?
    (self.neighbors > 3) && (self.alive?)
  end

  def zombie?
    (self.neighbors == 3) && (self.dead?)
  end

end
