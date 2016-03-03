require_relative '../lib/cell'

describe Cell do

  context "when a cell is created" do
    it "has no living neighbors" do
      cell = Cell.new
      expect(cell.neighbors).to eq(0)
    end

    it "is not alive" do
      cell = Cell.new
      expect(cell.alive?).to be false
    end

  end

  it "can be alive" do
    cell = Cell.new
    cell.giveLife
    expect(cell.alive?).to be true
  end

  it "knows how many neighbors it has" do
    cell = Cell.new
    cell.giveNeighbors(5)
    expect(cell.neighbors).to eq(5)
  end

end
