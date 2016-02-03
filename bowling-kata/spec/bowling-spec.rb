# require_relative 'spec_helper'
require_relative '../bowling-kata'


# The initial Score should be 0.

# A throw of 10 on a first throw should score 10, plus the next two throws.

# A throw of 0-9 should give the player a second try on the Frame.

# A Frame total of 0-9 should score the sum of the Frame.

# A Frame total of 10 and two throws should score 10, plus the next throw.

# A Game should stop after 10 Frames.

describe 'Game' do
  Lets_Bowl = Game.new

  it 'should start with a Score of 0' do
  @score.should be(0)
  end

end
