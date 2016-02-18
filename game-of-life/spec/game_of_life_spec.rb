require_relative '../lib/gol-mark-i'


describe Cycle do
  subject(:life) {Cycle.new}

  context "when an array is passed in" do
    it "stores the values in a two-dimentional array" do
      life.create_life(3, 3, [[0,0,0], [0,1,0], [0,0,0]])
      expect(life.cells).to eq([[0,0,0], [0,1,0], [0,0,0]])
    end

    it "can call a value correctly" do
      life.create_life(3, 3, [[0,0,0], [0,1,0], [0,0,0]])
      expect(life.cells[1][1]).to eq(1)

    end
  end

  context "when a live cell" do
    context "has fewer than two live neighbor cells" do
      it "becomes a dead cell" do
        # When cell = true & neighbor count < 2, cell = false
        life.create_life(3, 3, [[0,0,0], [0,1,0], [0,0,0]])
        expect(life.evolve).to eq([[0,0,0], [0,0,0], [0,0,0]])
      end
    end

    context "has greater than two live neighbor cells" do
      it "becomes a dead cell" do
        # when cell = true & neighbor count > 3, cell = false
        life.create_life(3, 3, [[1,0,1], [0,1,0], [1,1,1]])
        expect(life.evolve).to eq([[1,0,1], [0,1,0], [1,1,1]])
      end
    end

    context "has exactly two or three live neighbor cells" do
      it "remains a live cell" do
        # when cell = true & neighbor count == 2 or 3, cell = true

      end
    end

  end

  context "when a dead cell" do
    context "has exactly three live neighbor cells" do
      it "becomes a live cell" do
        # when cell = false & neighbor count == 3, cell = true
      end
    end
  end

end
