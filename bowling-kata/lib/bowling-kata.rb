
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


# CROMWELL BONUS CHALLENGE:
# When players roll a 7 they should get an extra 2 points.
# Add player input 'Driver' via command line.
# Reduce .to_i

require_relative "frame"

class Game
  FRAME_LIMIT = 10

  def initialize
    @throws = Array.new

  end

  def roll(pins)
    @throws << pins
  end

  def scoring
    score = 0
    new_throws = Array.new(@throws)

    FRAME_LIMIT.times do
      frame = Frame.new

      frame.rolls << new_throws.shift
      frame.rolls << new_throws.shift unless frame.strike?

      if frame.strike?
        frame.rolls << new_throws.first
        frame.rolls << new_throws[1]

      elsif frame.spare?
        frame.rolls << new_throws.first

      end

      if frame.seven?
          score += 2
      end
      score += frame.score


    end
    score

  end

end
