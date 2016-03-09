require_relative '../lib/game'

describe Game do

  context "when given an empty grid" do
    it "returns an empty grid" do
      grid = [[0,0],[0,0]]
      game = Game.new(grid)
      expect(game.evolve).to eq([[0,0],[0,0]])
    end
  end

  context "when given a grid" do
    it "can find the height and width" do
      grid = [[0,0,0],[0,0,0]]
      game = Game.new(grid)
      expect(game.height).to eq(2)
      expect(game.width).to eq(3)
    end
  end

end
