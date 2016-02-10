require "bowling-kata"

class Frame
  # When players roll a 7 they should get an extra 2 points.
  # Add player input 'Driver' via command line.
  # Reduce .to_i

  attr_accessor :rolls

  def initialize
    @rolls = Array.new
  end

  def score
    rolls
      .collect { |roll| roll.nil? ? 0 : roll }.reduce(:+)
      # .tap { |roll| p roll }
  end

  def strike?
    @rolls[0].to_i == 10

  end

  def spare?
    @rolls[0].to_i + @rolls[1].to_i == 10 && !strike?
  end

  def seven?
    (@rolls[0].to_i == 7) || (@rolls[1].to_i == 7)
  end

end
