
# SCORING
# If less than 10 pins are knocked down, the score is the sum of the pins.
# If 10 pins are knocked down on the first try of a frame, this is a strike.
#   The score of a strike is equal to 10, plus the sum of the next two throws.
# If 10 pins are knocked down on the second try of a frame, this is a spare.
#   The score of a spare is equal to 10, plus the score of the next throw.

# REQUIREMENTS
# Write a class named “Game” that has two methods
# roll(pins : int) is called each time the player rolls a ball.
# The argument is the number of pins knocked down.
# score() : int is called only at the very end of the game.
# It returns the total score for that game.

# => A Game is a Class
# => A Game has 10 Frames
# => A Frame has 1 or two rolls.
# => The tenth frame has two or three rolls.
#    It is different from all the other frames.
# => The score function must iterate through all
#    the frames, and calculate all their scores.
# => The score for a spare or a strike depends on the frame’s successor.

class Frame
  attr_accessor :rolls

  def initialize
    @rolls = Array.new
  end

  def score
    rolls.collect { |roll| roll.nil? ? 0 : roll }.reduce(:+)
  end

  # def strike?
  #   if roll[0]
  # end

end


class Game
  attr_accessor :score, :throws, :frames

  def initialize
    @throws = Array.new
  end

  def roll(pins)
    throws << pins
  end

  def frames
    (throws.size.fdiv 2).ceil
  end

  def scoring
    score = 0
    new_throws = Array.new(throws)

    frames.times do
      frame = Frame.new
      frame.rolls << new_throws.shift
      frame.rolls << new_throws.shift


      if frame.score == 10
        frame.rolls << new_throws.first
        score += frame.score

      else
        score += frame.score

      end

    end

    score
  end



end
