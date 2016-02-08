
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
  attr_accessor :roll1, :roll2

  def initialize (roll1, roll2)
    @roll1 = roll1
    @roll2 = roll2
  end

  def score
    roll1 + roll2
  end

end


class Game
  attr_accessor :score, :throws, :frames

  def initialize
    @throws = Array.new
    @frames = 10

  end

  def frames
    (throws.size / 2).ceil

  end

  def roll(pins)
    throws << pins
    # @score += pins # why do I need the @ in this method??
  end

  def scoring
    score = 0

    frames.times do |frame_number|
      frame = Frame.new(throws[frame_number], throws[frame_number + 1])
      # if throws[throw] == 10
      #   @score += (10 + throws[throw +1])
      
      if (frame.score  == 10)
        score += (throws[throw + 2] + 10)

      else
        score += (throws[throw] + throws[throw +1])
        frame_number
      end
    end
    score
  end



end
