require_relative '../lib/navigator'

describe Navigator do
  context "when the Navigator starts" do
    it "takes a two dimetional array" do
      height = 3
      width = 3
      grid = [[0,0,0],[0,1,0],[0,0,0]]
      nav = Navigator.new(height, width, grid)
      expect(nav.cells).to eq([[0,0,0],[0,1,0],[0,0,0]])
    end
  end

  context "when given a grid of data" do
    it "creates a cell object for each cell" do
      height = 3
      width = 3
      grid = [[1,0,1],[0,1,0],[1,0,0]]
      nav = Navigator.new(height, width, grid)
      expect(nav.newcells[1][1]).to be_a(Cell)
    end

    it "assigns a living or dead state to a cell" do
    height = 3
    width = 3
    grid = [[1,0,1],[0,1,0],[1,0,0]]
    nav = Navigator.new(height, width, grid)
    expect(nav.newcells[1][1].alive?).to be true
    end

    it "assigns a location to each cell object" do
      height = 3
      width = 3
      grid = [[1,0,1],[0,1,0],[1,0,0]]
      nav = Navigator.new(height, width, grid)
      expect(nav.newcells[1][0].x).to eq(1)
      expect(nav.newcells[1][0].y).to eq(0)
    end

    it "counts the living neighbors for each cell" do
      height = 3
      width = 3
      grid = [[1,0,1],[0,1,0],[1,0,0]]
      nav = Navigator.new(height, width, grid)
      expect(nav.countNeighbors(nav.newcells[1][1])).to eq(3)
    end

  end

end
