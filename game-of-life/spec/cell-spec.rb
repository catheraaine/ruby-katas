require_relative '../lib/cell'


describe Cell do
  subject(:cell) {Cell.new}

  context "when it is first created" do
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


  context "when a cell is dead" do
    context "and has exactly three live neighbors" do
      it "feels like a zombie" do
        cell.current_neighbors(3)
        expect(cell.zombie?).to be true
      end
    end

  end

  context "when a cell is alive" do
    context "and has less than two live neighbors" do
      it "feels lonely" do
        cell.birth
        cell.current_neighbors(1)
        expect(cell.lonely?).to be true
      end

      it "does not feel happy" do
        cell.birth
        cell.current_neighbors(1)
        expect(cell.happy?).to be false
      end

      it "does not feel crowded" do
        cell.birth
        cell.current_neighbors(0)
        expect(cell.crowded?).to be false
      end

    end

    context "and has more than three live neighbors" do
      it "feels crowded" do
        cell.birth
        cell.current_neighbors(6)
        expect(cell.crowded?).to be true
      end

      it "does not feel lonely" do
        cell.birth
        cell.current_neighbors(6)
        expect(cell.lonely?).to be false
      end

      it "does not feel happy" do
        cell.birth
        cell.current_neighbors(7)
        expect(cell.happy?).to be false
      end

    end

    context "and has exactly two or three live neighbors" do
      it "feels happy" do
        cell.birth
        cell.current_neighbors(3)
        expect(cell.happy?).to be true
      end

      it "does not feel crowded" do
        cell.birth
        cell.current_neighbors(2)
        expect(cell.crowded?).to be false
      end

      it "does not feel lonely" do
        cell.birth
        cell.current_neighbors(3)
        expect(cell.lonely?).to be false
      end

    end

  end
end
