require_relative 'bowling-kata'
require 'colorize'
require_relative 'player'

#################################################################
## Methods
#################################################################


def startGame
  puts 'Would you like to start scoring a new game?'
  puts 'Y or N?'
  answer = gets.chomp

  if answer == "Y" || answer == "y"
    puts "Okay. Let's start!"
    getPlayers
  else
    puts "Okay. Bye!"
    endGame
  end
end


def getInteger
  begin
    number = gets.chomp
    number = Integer(number)
    return number
  rescue
    print "Please enter a number: \n"
    retry
  end
end


def endGame
  puts "Exiting Game ... "
  exit
end


def getPlayerNumber
  puts "How many players?"

  begin
    puts "Choose a number of players between 1 and 4."
    player_number = getInteger
  end until player_number.between?(1, 4)

  return player_number
end


def getPlayers

  player_number = getPlayerNumber

  player_number.times do |player|
    puts "This is player #{player + 1}"

  end

end





#################################################################
## Method Calls
#################################################################

startGame
