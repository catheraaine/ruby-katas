require "bowling-kata"

class Frame

  attr_accessor :rolls, :roll1, :roll2

  def initialize
    @rolls = Array.new
    #
    # @roll1 = rolls[0] || 0
    # @roll2 = rolls[1] || 0

  end

  def score
    rolls.collect { |roll| roll.nil? ? 0 : roll }.reduce(:+)
      # .tap { |roll| p roll }
  end

  def clean_roll(index)
    rolls[index] || 0
  end

  def strike?
    clean_roll(0) == 10
  end

  def spare?
    clean_roll(0) + clean_roll(1) == 10 && !strike?
  end

  def seven?
    (clean_roll(0) == 7) || (clean_roll(1) == 7)
  end

end
