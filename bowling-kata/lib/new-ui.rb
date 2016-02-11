require_relative 'bowling-kata'

#################################################################
## Methods
#################################################################



def newGame
  puts 'Would you like to start scoring a new game?'
  puts 'Y or N?'
  answer = gets.chomp

  if answer = ('Y' || 'y')
    puts "Okay. Let's start a new game!"
    @game = Game.new
    @framecount = 0
    return true
  else
    puts "Okay. Bye!"
    exit
  end


end


def printScore
  puts "The current score is: #{@game.scoring}."
end


def newFrame
  @framecount += 1
  puts "The current Frame is: #{@framecount}."
end


def getThrow
  puts 'What did you throw?'
  pins = gets.chomp.to_i
  @game.roll(pins)
  printScore
end


def strike?

end


def spare?

end

def bonusRoll

end

def printFinal

end

def endGame

end

#################################################################
## Logic Path
#################################################################

if newGame
  printScore
  newFrame
  getThrow





end
