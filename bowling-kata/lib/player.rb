require_relative 'bowling-kata'

class Player
  attr_accessor :player_name, :player_game

  def intialize
    @player_game = Game.new
  end

  def storeName(name)
    @player_name = name
  end

  def name
    @player_name || "This player is no one!"

  end

  def player_roll(pins)
    @player_game.roll(pins)
  end

end
