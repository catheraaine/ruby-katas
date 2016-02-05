# require_relative 'spec_helper'
require_relative '../lib/bowling-kata'

# The initial Score should be 0.
# A throw of 10 on a first throw should score 10, plus the next two throws.
# A throw of 0-9 should give the player a second try on the Frame.
# A Frame total of 0-9 should score the sum of the Frame.
# A Frame total of 10 and two throws should score 10, plus the next throw.
# A Game should stop after 10 Frames.

describe Game do

  context 'when the game starts' do
    it 'should have a score of zero' do
        yeah_bowling = Game.new
        expect(yeah_bowling.score).to eq(0)
    end

  end

  it 'scores all zeros as zero' do
    yeah_bowling = Game.new
    20.times { yeah_bowling.roll(0) }
    expect(yeah_bowling.score).to eq(0)

  end

  it 'scores all 1s as 20' do
    yeah_bowling = Game.new
    20.times { yeah_bowling.roll(1) }
    expect(yeah_bowling.scoring).to eq(20)

  end

  it 'scores all 4s as 80' do
    yeah_bowling = Game.new
    20.times { yeah_bowling.roll(4) }

    expect(yeah_bowling.scoring).to eq(80)
  end
  #
  # it 'scores all 5s (spares) as 150' do
  #   yeah_bowling = Game.new
  #   20.times { yeah_bowling.roll(5) }
  #   expect(yeah_bowling.score).to eq(150)
  # end

  # it 'scores all strikes as 300' do
  #
  # end


end
