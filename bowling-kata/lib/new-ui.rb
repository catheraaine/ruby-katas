require_relative 'bowling-kata'
require 'colorize'


# green shows a game-level item
# light_yellow prints the current score or frame
# blue shows a new frame
# light_blue asks for something
# magenta shows a 'wow' statement


#################################################################
## Methods
#################################################################

def newGame
  puts 'Would you like to start scoring a new game?'
  puts 'Y or N?'
  answer = gets.chomp

  if answer == "Y" || answer == "y"
    puts "Okay. Let's start!"
    puts "Note: This game works best on a dark console window."

    puts "How many players?"
    player_number = gets.chomp

    puts "=> NEW GAME <=".green
    @game = Game.new
    @framecount = 0
    return true

  else
    puts "Okay. Bye!"
    endGame
  end

end

def endGame
  puts "Exiting Game ... "
  exit
end

def printScore
  puts "The current score is: #{@game.scoring}.".light_yellow
end


def newFrame
  @framecount += 1
  puts "=> NEW FRAME <=".blue
  puts "The current Frame is: #{@framecount}.".light_yellow
end

def grabRoll
  begin
    pins = gets.chomp
    pins = Integer(pins)
    return pins
  rescue
    print "Please enter a number: "
    retry
  end
end

def getThrows
  puts 'What was your first throw?'.light_blue
  pins1 = grabRoll
  @game.roll(pins1)
  printScore

  if pins1 == 10
    puts "WOAH! A STRIKE!".magenta
    @strike = true
  else
    puts 'What was your second throw?'.light_blue
    pins2 = grabRoll
    @game.roll(pins2)
    @strike = false
  end

  if (pins1.to_i + pins2.to_i) == 10 && !@strike
    puts "Woah, cool! A Spare!".magenta
  end

  printScore

  if @framecount == 9
    finalFrame
  else
    newFrame
    getThrows
  end

end

def finalFrame
  puts "=> FINAL FRAME <=".blue
  puts 'What was your first throw?'.light_blue
  pins1 = grabRoll
  @game.roll(pins1)
  printScore

  if pins1 == 10
    puts "WOAH! A STRIKE! Bonus throw time!".magenta
    bonusThrow
    puts "And a strike earns you another..".magenta
    bonusThrow
    @strike = true

  else
    puts 'What was your second throw?'.light_blue
    pins2 = grabRoll
    @game.roll(pins2)
  end

  if (pins1.to_i + pins2.to_i) == 10 && !@strike
    puts "Woah, cool! A Spare! Bonus throw time!".magenta
    bonusThrow
  end

  finalScore
end

def bonusThrow
  puts "What was your bonus throw?".light_blue
  pins1 = gets.chomp.to_i || 0
  @game.roll(pins1)
end

def finalScore
  puts "Your *FINAL SCORE* is: #{@game.scoring}".green
  endGame
end



#################################################################
## Starting Logic Path
#################################################################

if newGame
  printScore
  newFrame
  getThrows
end
