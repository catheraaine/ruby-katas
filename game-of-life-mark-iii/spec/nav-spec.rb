require_relative '../lib/navigator'

describe Navigator do
  subject(:nav) { Navigator.new(3, 3, [[0,0,0],[0,1,0],[0,0,0]]) }

  context "when the Navigator starts" do
    it "takes a two dimetional array" do
      expect(nav.cells).to eq([[0,0,0],[0,1,0],[0,0,0]])
    end
  end

  context "when given a grid of cells" do
    it "counts the living neighbors for each cell" do
      puts nav.mapCells
      expect(nav.mapCells).to eq([[0,0,0],[0,1,0],[0,0,0]])
    end

  end

end
