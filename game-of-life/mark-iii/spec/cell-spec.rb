require_relative '../lib/cell'

describe Cell do

  context "when a cell is created" do
    it "has no living neighbors" do
      cell = Cell.new
      expect(cell.neighbors).to eq(0)
    end
  end



end
