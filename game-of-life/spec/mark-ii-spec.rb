require_relative '../lib/gol-mark-ii'


describe Cell do
  subject(:cell) {Cell.new}

  context "when a cell is created" do
    it "has a default state of dead" do
      expect(cell.alive?).to be false
    end



  end

end
