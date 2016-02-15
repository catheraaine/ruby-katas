require_relative '../lib/gol-mark-i'


describe Cycle do
  context "when a live cell" do

    context "has fewer than two live neighbor cells" do
      it "becomes a dead cell" do
        # When cell = true &
      end
    end

    context "when a live cell has greater than two live neighbor cells" do
      it "becomes a dead cell" do

      end
    end

    context "when a live cell has exactly two or three live neighbor cells" do
      it "remains a live cell" do

      end
    end

  end

  context "when a dead cell has exactly three live neighbor cells" do
    it "becomes a live cell" do

    end
  end

end
