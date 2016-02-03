
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


class Game
  attr_reader :score

  def initialize
    @score = 0 #Test that the Score = 0
  end

  def roll(pins)


  end

  def score()

  end


end
