require_relative '../lib/gol-mark-ii'


describe Cell do
  subject(:cell) {Cell.new}

  context "when a cell is created" do
    it "has a default state of dead" do
      expect(cell.alive?).to be false
    end

    it "has a default neighbor count of 0" do
      expect(cell.neighbors?).to eq(0)
    end

  end

  it "can be assigned a state of alive" do
    cell.birth
    expect(cell.alive?).to be true
  end

  it "can store a number of living neighbors" do
    cell.current_neighbors(3)
    expect(cell.neighbors?).to eq(3)
  end


end
