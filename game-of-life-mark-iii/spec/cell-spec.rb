require_relative '../lib/cell'

describe Cell do
  subject(:cell) { Cell.new(1,1)}
  context "when a cell is created" do
    it "has no living neighbors" do
      expect(cell.neighbors).to eq(0)
    end

    it "is not alive" do
      expect(cell.alive?).to be false
    end

  end

  it "can be alive" do
    cell.giveLife
    expect(cell.alive?).to be true
  end

  it "knows how many neighbors it has" do
    cell.giveNeighbors(5)
    expect(cell.neighbors).to eq(5)
  end

end
