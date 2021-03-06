require_relative '../lib/rules-runner'
require_relative '../lib/cell'

describe Cell do
  subject(:cell) { Cell.new(1,1)}

  context "when a living cell has 2 or 3 neighbors" do
    it "is a happy cell" do
      cell.giveLife
      cell.giveNeighbors(2)
      expect(cell.happy?).to be true
    end
  end

  context "when a living cell has less than 2 neighbors" do
    it "is a lonely cell" do
      cell.giveLife
      cell.giveNeighbors(1)
      expect(cell.lonely?).to be true
    end

    it "is not a happy cell" do
      cell.giveLife
      cell.giveNeighbors(1)
      expect(cell.happy?).to be false
    end

  end

  context "when a living cell has more than 3 neighbors" do
    it "is a crowded cell" do
      cell.giveLife
      cell.giveNeighbors(5)
      expect(cell.crowded?).to be true
    end

    it "is not a lonely cell" do
      cell.giveLife
      cell.giveNeighbors(5)
      expect(cell.lonely?).to be false
    end

  end

  context "when a dead cell has exactly 3 living neighbors" do
    it "is a zombie cell" do
      cell.giveNeighbors(3)
      expect(cell.zombie?).to be true
    end

    it "is not a happy cell" do
      cell.giveNeighbors(3)
      expect(cell.happy?).to be false
    end

  end

end
