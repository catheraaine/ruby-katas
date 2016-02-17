require_relative 'bowling-kata'
require 'colorize'

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
  # This method should create @players as a hash of all the players.
  @players = Hash.new
  player_number = getPlayerNumber

  player_number.times do |player_num|
    # player = Player.new
    puts "Hey Player # #{player_num + 1}, what is your first name?"
    player_name = gets.chomp
    # player.storeName(player_name)
    puts "#{player_name} has joined the game!"
    @players[player_name] = Game.new
  end

  beginScoring

end

def beginScoring
  @framecount = 0

  until @framecount == 9 do
    newFrame
    @players.each_pair do |named, player|
      puts "It is #{named}'s Turn!".blue
      getThrows(named)
    end
    printScore
  end

  puts "=> FINAL FRAME <=".blue
  @players.each_pair do |named, player|
    puts "It is #{named}'s Turn!".blue
    finalFrame(named)
  end

  finalScore
  endGame

end

def newFrame
  @framecount += 1
  puts "=> NEW FRAME <=".blue
  puts "The current Frame is: #{@framecount}".light_yellow
end


def getThrows(named)
  puts 'What was your first throw?'.light_blue
  pins1 = getInteger
  @players[named].roll(pins1)

  if pins1 == 10
    puts "WOAH! A STRIKE!".magenta
    @strike = true
  else
    puts 'What was your second throw?'.light_blue
    pins2 = getInteger
    @players[named].roll(pins2)
    @strike = false
  end

  if (pins1.to_i + pins2.to_i) == 10 && !@strike
    puts "Woah, cool! A Spare!".magenta
  end

end

def printScore
  puts "The current scores are: \n"
  @players.each_pair do |named, player|
    puts "#{named} - #{@players[named].scoring}".yellow
  end

end


def finalFrame(named)
  puts 'What was your first throw?'.light_blue
  pins1 = getInteger
  @players[named].roll(pins1)

  if pins1 == 10
    puts "WOAH! A STRIKE! Bonus throw time!".magenta
    bonusThrow(named)
    puts "And a Strike earns you another!".magenta
    bonusThrow(named)
    @strike = true

  else
    puts 'What was your second throw?'.light_blue
    pins2 = getInteger
    @players[named].roll(pins2)
  end

  if (pins1.to_i + pins2.to_i) == 10 && !@strike
    puts "Woah, cool! A Spare! Bonus throw time!".magenta
    bonusThrow(named)
  end

end

def bonusThrow(named)
  puts "What was your bonus throw?".light_blue
  pins1 = getInteger
  @players[named].roll(pins1)
end

def finalScore
  puts "The *FINAL SCORE* is:".green
  @players.each_pair do |named, player|
    puts "#{named} - #{@players[named].scoring}".yellow
  end

end


#################################################################
## Method Calls
#################################################################

startGame
