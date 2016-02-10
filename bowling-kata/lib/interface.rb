require_relative 'bowling-kata'


class Bowling

  def initialize
  end

  # BASIC FRAME METHOD #
  def basicFrame
    puts "New Frame! Frame ##{currentFrame}"
    puts "What is the result of your first throw?"
    roll1 = gets.chomp.to_i
    lets_bowl.roll(roll1)


    if roll1 < 10
      puts "What is the result of your second throw?"
      roll2 = gets.chomp.to_i
      lets_bowl.roll(roll2)
    else
      puts "WOAH! STRIKE!"
    end

    if (roll2.to_i + roll2.to_i) == 10
      puts "Woah. Spare!"
    end

    # Print the score, move to the next Frame.
    puts "The current score is #{lets_bowl.scoring}."
    currentFrame += 1
  end

  # NORMAL FRAME METHOD #

  def finalFrame
    puts "Last Frame! Frame ##{currentFrame}"
    puts "What is the result of your first throw?"
    tenth1 = gets.chomp.to_i
    lets_bowl.roll(tenth1)
    puts "The current score is #{lets_bowl.scoring}."

    if roll1 < 10
      puts "What is the result of your second throw?"
      tenth2 = gets.chomp.to_i
      lets_bowl.roll(tenth2)
    elsif (roll1 + roll2) == 10
      puts "Woah. Spare!"
    else
      puts "WOAH! STRIKE!"
    end

    if (roll1 + roll2) == 10
        puts "Bonus roll time!"
        puts "What was your bonus roll?"
          roll1 = gets.chomp.to_i
          lets_bowl.roll(roll1)
    end

    if roll1 == 10
      puts "What was your second bonus roll?"
      roll2 = gets.chomp.to_i
      lets_bowl.roll(roll2)
    end
  end

  # NEW GAME METHOD #
  def newGame(bowlingGame)
    puts "Hey! Would you like to start a game of bowling?"
    puts "'yes' or 'no': "
    newgame = gets.chomp

    if newgame == "yes"
      puts "New Game. The current score is 0."
      lets_bowl = Game.new


      9.times do
        bowlingGame.basicFrame
      end

    else
      puts "Okay, bye!"
      exit
    end

  end

end

### Start calling methods!! ###

bowlingGame = Bowling.new
bowlingGame.newGame(bowlingGame)
