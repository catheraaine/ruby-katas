require_relative '../lib/game'

describe Game do

  context "when given an empty grid" do
    it "returns an empty grid" do
      grid = [[0,0],[0,0]]
      game = Game.new(grid)
      expect(game.evolve).to eq([[0,0],[0,0]])
    end
  end

  context "when given an array" do
    it "can find the height and width" do
      grid = [[0,0,0],[0,0,0]]
      game = Game.new(grid)
      expect(game.height).to eq(2)
      expect(game.width).to eq(3)
    end
  end

  context "when a cell is alive" do
    context "and has less than two live neighbors" do
      it "will not live to the next round" do
        grid = [[0,0,0],[0,1,0],[0,0,0]]
        game = Game.new(grid)
        expect(game.evolve).to eq ([[0,0,0],[0,0,0],[0,0,0]])
      end
    end

    context "when a cell has more than three live neighbors" do
      it "will not live to the next round" do
        grid = [[1,1,1], [0,1,0], [1,1,0]]
        game = Game.new(grid)
        expect(game.evolve).to eq ([[1,1,1],[0,0,0],[1,1,0]])
      end
    end

    context "and a cell has exactly two or three live neighbors" do
      it "will live to the next round" do
        grid = [
          [1,0,0],
          [0,1,0],
          [0,0,1]]
        game = Game.new(grid)
        expect(game.evolve).to eq ([
          [0,0,0],
          [0,1,0],
          [0,0,0]])
      end
    end
  end

  context "when a cell is dead" do
    context "and has exactly three live neighbors" do
      it "will become alive in the next round" do
        grid = [
          [0,1,0],
          [0,0,1],
          [0,1,0]]
        game = Game.new(grid)
        expect(game.evolve).to eq([
          [0,0,0],
          [0,1,1],
          [0,0,0]])

      end
    end
  end

end
