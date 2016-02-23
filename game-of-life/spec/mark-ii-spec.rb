require_relative '../lib/gol-mark-ii'

describe Cycle do

  context "when a cycle begins" do
    it "takes a grid of input" do
      height = 3
      width = 3
      grid = "...\n.*.\n..."
      Cycle.new(height, width, grid)
    end
  end

  context "when a cell is alive" do

    context "and has less than two live neighbors" do
      it "does not live" do
        height = 3
        width = 3
        grid = "...\n.*.\n..."
        cycle = Cycle.new(height, width, grid)
        expect(cycle.evolve).to eq("...\n...\n...")
      end
    end

    context "and has more than three live neighbors" do
      it "does not live" do
        height = 3
        width = 3
        grid = "***\n***\n***"
        cycle = Cycle.new(height, width, grid)
        expect(cycle.evolve).to eq("*.*\n...\n*.*")
      end

      it "does still not live" do
        height = 3
        width = 3
        grid = "*.*\n.*.\n***"
        cycle = Cycle.new(height, width, grid)
        expect(cycle.evolve).to eq(".*.\n...\n***")
      end
    end

    context "and has exactly two or three live neighbors" do
      it "lives to the next generation" do
        height = 3
        width = 3
        grid = "*..\n.*.\n..*"
        cycle = Cycle.new(height, width, grid)
        expect(cycle.evolve).to eq("...\n.*.\n...")
      end

      it "still lives to the next generation" do
        height = 3
        width = 3
        grid = "...\n**.\n*.."
        cycle = Cycle.new(height, width, grid)
        expect(cycle.evolve).to eq("...\n**.\n**.")
      end

    end

  end

  context "when a cell is dead" do
    context "and has exactly three live neighbors" do
      it "is reborn" do
        height = 3
        width = 3
        grid = ".*.\n..*\n.*."
        cycle = Cycle.new(height, width, grid)
        expect(cycle.evolve).to eq("...\n.**\n...")
      end
    end

  end

  context "when a large grid is passed in" do
    it "is still consistant" do
      height = 15
      width = 15
      grid = ".....***.....**\n.*...........**\n...**..*...*...\n...**.*.*...*..\n.......*..*....\n.........*.....\n..*.*.*........\n.....*..*......\n**.*....*...***\n*.*..**.*......\n........*....**\n...**...*...*..\n.*...*.....*.*.\n......*...*.*..\n...........*..."
      cycle = Cycle.new(height, width, grid)
      expect(cycle.evolve).to eq("......*......**\n....**.*....***\n..****.*....**.\n...****.*..*...\n.......***.....\n...............\n.....*.........\n.*****.*.....*.\n***.***.**...*.\n*.*.....**..*..\n...***..**...*.\n....*.......*.*\n....**.....*.*.\n..........*.*..\n...........*...")

    end

  end

end
